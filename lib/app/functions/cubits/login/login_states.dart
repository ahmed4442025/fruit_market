abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginChangeBgState extends LoginStates {}

// -------- send code --------
class LoginSendingCodeState extends LoginStates {}
class LoginSendOkCodeState extends LoginStates {}
class LoginSendErrorCodeState extends LoginStates {}

// -------- confirm code --------
class LoginConfirmingCodeState extends LoginStates {}
class LoginConfirmOkCodeState extends LoginStates {}
class LoginConfirmErrorCodeState extends LoginStates {}

