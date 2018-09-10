import React, {Component, Fragment} from 'react';
import '../assets/css/signup.css';
import {Link} from "react-router-dom";
import { reduxForm, Field } from 'redux-form';
import { connect } from 'react-redux';
import { createUserAccount } from '../actions'

class SignUp extends Component{

    userSignUp = (values) => {
        this.props.createUserAccount(values)
    }

    renderInput(props){
        const { label, type, input, meta: {touched, error}} = props;
        return (
            <Fragment>
                <label>{label}</label>
                <input {...input} type={type} />
                <p className="red-text">{touched && error}</p>
            </Fragment>
        )
    }

    render(){
        const {handleSubmit} = this.props;
        return (

            <div className='container signup'>
                <form className='col' onSubmit={handleSubmit(this.userSignUp)}>

                    <div className='row'>
                        <div className='input-field col s6'>
                            <i className="material-icons prefix">person_outline</i>
                            <Field name='firstName' label='First Name' type='text' component={this.renderInput}/>
                        </div>
                        <div className='input-field col s6'>
                            <i className="material-icons prefix">person_outline</i>
                            <Field name='lastName' label='Last Name' type='text' component={this.renderInput} />
                        </div>
                    </div>
                    <div className='input-field col s6'>
                        <i className="material-icons prefix">email</i>
                        <Field name='email' label='Email' type='text' component={this.renderInput} />
                    </div>
                    <div className='input-field col s6'>
                        <i className="material-icons prefix">person</i>
                        <Field name='username' label='Username' type='text' component={this.renderInput} />
                    </div>
                    <div className='input-field col s6'>
                        <i className="material-icons prefix">lock</i>
                        <Field name='password' label='Password' type='text' component={this.renderInput} />
                    </div>
                    <div className='input-field col s6'>
                        <i className="material-icons prefix">lock</i>
                        <Field name='c_password' label='Confirm Password' type='text' component={this.renderInput} />
                    </div>
                    <div className='center'>
                    <div className='btn btn-small'>
                        <button type="submit">Sign Up</button>
                    </div>
                </div>
                </form>
               
            </div>
        );
    }
}

function validate(values){
    const { firstName, lastName, username, email, password, c_password } = values;
    const errors = {};

    if(!firstName){
        errors.firstName = 'First name is required.'
    }
    if (!lastName) {
        errors.lastName = 'Last name is required.'
    }
    if (!email) {
        errors.email = 'Email is required.'
    }
    if (!username) {
        errors.username = 'Username is required.'
    }
    if (!password) {
        errors.password = 'Password is required.'
    }
    if(password !== c_password ){
        errors.c_password = 'Password do not match' 
    }
    return errors;
}

// function mapStateToProps(state){

// }

SignUp = reduxForm({
    form: 'sign-form',
    validate: validate
})(SignUp);

export default connect(null, {createUserAccount})(SignUp);