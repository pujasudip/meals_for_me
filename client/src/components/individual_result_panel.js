import React, {Fragment} from 'react';
import { Link } from 'react-router-dom';
import '../assets/css/indiv_result.css';

function OneResult(props){
    let style = {
        'width': '120px',
        'border': '2px solid #7F977C'
    };

    const {id, imageSrc, title, likes} = props;

    return (
        <div className="resultContainer">
            <Link to={`/recipe/${id}`}>
                <div className="resultRow" key={id}>
                    <div className="foodImg">
                        <img src={imageSrc}/>
                    </div>
                    <div className="title-likes">
                        <div className="resultTitle">{title}</div>
                        <div className="resultLikes">Likes: {likes}</div>
                    </div>
                </div>
            </Link>
        </div>

    );
}

export default OneResult;