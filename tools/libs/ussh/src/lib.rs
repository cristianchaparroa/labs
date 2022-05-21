//! Provides an  abstraction for SSH  protocol
//! The  following are taks that you can perform  with this:
//!
//! [x] Connect to ssh  server with user and pass
//! [x] execute remote commands
//!

use errors::SSHError;
pub mod client;
pub mod errors;

pub trait Client {
    fn execute(&self, command: &str) -> Result<String, SSHError>;
}
