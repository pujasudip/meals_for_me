import React from 'react';
import { Link } from 'react-router-dom';

function OneResult(props){
    let style = {
        'width': '120px',
        'border': '1px solid green',
    };

    return (
        <Link to='/recipe'>
            <div className='card-panel'>
                <div className="row" key={props.id}>
                    <div className="col s6">
                        <img src={props.imageSrc} style={style}/>
                    </div>
                    <div className="col s4">{props.title}</div>
                    <div className="col s2">{props.likes}</div>
                </div>
            </div>
        </Link>
    );
}

export default OneResult;