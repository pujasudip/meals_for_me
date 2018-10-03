import React from 'react';
import '../assets/css/indiv_result.css';
import { Link } from 'react-router-dom';

function OneResult(props){

    const {id, imageSrc, title, likes} = props;

    return (
        <Link to={`/recipe/${id}`}>
            <div className='mainContentRecipe'>
                <div className="row resultRow" key={id}>
                    <div className="pictureFrame">
                        <img src={imageSrc}/>
                    </div>
                    <div className="titleText col s6">{title}</div>
                    <div className="likeTitle col s6">Likes: {likes}</div>
                </div>
            </div>
        </Link>
    );
}

export default OneResult;