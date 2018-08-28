import React from 'react';
import '../assets/css/member.css';

function Member(props){
    return (
        <div className='body valign-wrapper memberIndividual'>
            <div className='memberPicture center-align'>
                <img className='memberImg' src={props.image} />
            </div>
            <div className='memberInfo'>
                <h5 className='left-align'>{props.name}</h5>
                <p onClick={()=>props.clicked(props.linkedin)}>{props.linkedin}</p>
                <p className='left-align'>{props.github}</p>
            </div>
        </div>
    );
}

export default Member;