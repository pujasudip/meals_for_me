import React from 'react';
import '../assets/css/member.css';

function Member(props){
    return (
        <div className='body valign-wrapper memberIndividual'>
            <div className='memberPicture center-align'>image</div>
            <div className='memberInfo'>
                <h5 className='left-align'>{props.name}</h5>
                <p className='left-align'><a href={props.linkedin}>LinkedIn</a></p>
                <p className='left-align'><a href={props.github}>Github</a></p>
            </div>
        </div>
    );
}

export default Member;