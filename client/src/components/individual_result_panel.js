import React from 'react';
import { Link } from 'react-router-dom';

function OneResult(props){
    let style = {
        'width': '120px',
        'border': '1px solid green',
    };

    const {id, imageSrc, title, likes} = props;

    return (
        <Link to={`/recipe/${id}`}>
            <div className=''>
                <div className="row" key={id}>
                    <div className="col s5">
                        <img src={imageSrc} style={style}/>
                    </div>
                    <div className="col s6">{title}</div>
                    <div className="col s6">Likes: {likes}</div>
                </div>
            </div>
        </Link>
    );
}

export default OneResult;