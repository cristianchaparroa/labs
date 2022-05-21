use core::fmt;

#[derive(Debug, Clone)]
pub enum SSHError {
    AuthenticationErr,
    UnAuthorizedErr,
    ExecutionErr,
    ExecutionResponseErr,
    ChannelErr,
}

impl std::error::Error for SSHError {}

impl fmt::Display for SSHError {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            SSHError::AuthenticationErr => write!(f, "Authentication error"),
            SSHError::UnAuthorizedErr => write!(f, "Unauthorized error"),
            SSHError::ExecutionErr => write!(f, "Execution error"),
            SSHError::ExecutionResponseErr => write!(f, "Execution response error"),
            SSHError::ChannelErr => write!(f, "Error creating a channel"),
        }
    }
}
