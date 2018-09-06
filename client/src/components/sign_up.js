import React, {Component, Fragment} from 'react';
import '../assets/css/signup.css';
import {Link} from "react-router-dom";

class SignUp extends Component{

    renderInput(){

    }


    render(){
        return (
            <div className='signup'>
                <form className='col'>
                    <div className='row'>
                        <div className='input-field col s6'>
                            <i className="material-icons prefix">person_outline</i>
                            <input name='firstName'
                                   id='fName'
                                   type='text'
                                   className='validate' />
                            <label htmlFor='fName'>First Name</label>
                        </div>
                        <div className='input-field col s6'>
                            <i className="material-icons prefix">person_outline</i>
                            <input name='lastName'
                                   id='lName'
                                   type='text'
                                   className='validate' />
                            <label htmlFor='lName'>Last Name</label>
                        </div>
                    </div>
                    <div className='input-field col s6'>
                        <i className="material-icons prefix">person</i>
                        <input name='username'
                               id='username'
                               type='text'
                               className='validate' />
                        <label htmlFor='username'>Username</label>
                    </div>
                    <div className='input-field col s6'>
                        <i className="material-icons prefix">email</i>
                        <input name='email'
                               id='email'
                               type='tel'
                               className='validate' />
                        <label htmlFor='email'>Email</label>
                    </div>
                    <div className='input-field col s6'>
                        <i className="material-icons prefix">lock</i>
                        <input name='password'
                               id='password'
                               type='tel'
                               className='validate' />
                        <label htmlFor='password'>Password</label>
                    </div>
                    <div className='input-field col s6'>
                        <i className="material-icons prefix">lock</i>
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