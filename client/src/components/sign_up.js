import React from 'react';
import '../assets/css/signup.css';
import {Link} from "react-router-dom";

class SignUp extends React.Component{
    render(){
        return (
            <div className='container signup'>
                <form className='col'>
                    <div className='row'>
                        <div className='input-field col s6'>
                            <input id='fName'
                                   type='text'
                                   className='validate' />
                            <label htmlFor='fName'>First Name</label>
                        </div>
                        <div className='input-field col s6'>
                            <input id='lName'
                                   type='text'
                                   className='validate' />
                            <label htmlFor='lName'>Last Name</label>
                        </div>
                    </div>
                    <div className='input-field col s6'>
                        <input id='username'
                               type='text'
                               className='validate' />
                        <label htmlFor='username'>Username</label>
                    </div>
                    <div className='input-field col s6'>
                        <input id='icon_email'
                               type='tel'
                               className='validate' />
                        <label htmlFor='icon_email'>Email</label>
                    </div>
                    <div className='input-field col s6'>
                        <input id='password'
                               type='tel'
                               className='validate' />
                        <label htmlFor='password'>Password</label>
                    </div>
                    <div className='input-field col s6'>
                        <input id='c_password'
                               type='tel'
                               className='validate' />
                        <label htmlFor='c_password'>Confirm Password</label>
                    </div>
                </form>
                <div className='center'>
                    <div className='btn btn-small'>
                        <Link to='/signup' className='white-text'>Sign Up</Link>
                    </div>
                </div>
            </div>
        );
    }
}

export default SignUp;