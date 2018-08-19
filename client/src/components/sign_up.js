import React from 'react';
import '../assets/css/signup.css';

class SignUp extends React.Component{
    render(){
        return (
            <div className='signupPage'>
                <div>
                    <label>User name:</label><input className='username'/>
                </div>
                <div>
                    <label>Password</label><input type='password' className='password'/>
                </div>
                <div>
                    <label>Confirm Password</label><input type='password' className='password'/>
                </div>
                <button>Sign Up</button>
            </div>
        );
    }
}

export default SignUp;