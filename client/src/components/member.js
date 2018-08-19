import React from 'react';
import '../assets/css/member.css';

function Member(props){
    return (
        <div className='body valign-wrapper memberIndividual'>
            <div className='memberPicture center-align'>image</div>
            <div className='memberInfo'>
                <h4 className='left-align'>Name: {props.name}</h4>
                <h5 className='left-align'><a href={props.linkedin}>LinkedIn</a></h5>
                <h5 className='left-align'><a href={props.github}>Github</a></h5>
            </div>
        </div>
    );
}

export default Member;