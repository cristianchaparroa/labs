use ussh::client::{SSHClient, SSHConfig};
use ussh::Client;

fn main() {
    let config = SSHConfig::new("192.168.8.1:22", "root", "111111");

    let conn = match SSHClient::new(&config) {
        Ok(conn) => conn,
        Err(_) => return,
    };

    let output = conn.execute("cd .. &&  ls -la").unwrap();

    println!("{}", output);
}
