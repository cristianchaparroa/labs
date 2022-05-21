use ssh2::Session;

use crate::errors::SSHError;
use std::io::prelude::*;
use std::net::TcpStream;

pub struct SSHConfig {
    addr: String,
    user: String,
    pass: String,
}

impl SSHConfig {
    pub fn new(addr: &str, user: &str, pass: &str) -> Self {
        SSHConfig {
            addr: addr.to_string(),
            user: user.to_string(),
            pass: pass.to_string(),
        }
    }
}

pub struct SSHConn {
    sess: Session,
}

impl SSHConn {
    pub fn new(c: &SSHConfig) -> Result<SSHConn, SSHError> {
        let tcp = TcpStream::connect(&c.addr).unwrap();
        let mut sess = Session::new().unwrap();
        sess.set_tcp_stream(tcp);
        sess.handshake().unwrap();
        sess.userauth_password(&c.user, &c.pass).unwrap();

        if !sess.authenticated() {
            return Err(SSHError::UnAuthorizedErr);
        }

        Ok(SSHConn { sess: sess })
    }

    pub fn execute(&self, command: &str) -> Result<String, SSHError> {
        let mut channel = match self.sess.channel_session() {
            Ok(chan) => chan,
            Err(_) => return Err(SSHError::ChannelErr),
        };

        match channel.exec(command) {
            Ok(_) => {}
            Err(_) => return Err(SSHError::ExecutionErr),
        }

        let mut output = String::new();

        match channel.read_to_string(&mut output) {
            Ok(_) => {}
            Err(_) => return Err(SSHError::ExecutionResponseErr),
        }

        channel.wait_close().unwrap();
        channel.exit_status().unwrap();

        Ok(output)
    }
}
