import React, {Component} from 'react';
import '../assets/css/recipe.css';
import emptyHeart from '../assets/images/heart-outline.png'
import redHeart from '../assets/images/heart-icon-red.png'

class Recipe extends Component {
    constructor(props) {
        super(props);
        this.state = {
            imgSrc: emptyHeart,
            addFavText: 'Add to Favorites'
        }
    }
changeHeart = ()=>{
    let heartStatus;
    if(this.state.imgSrc === emptyHeart){
        heartStatus = redHeart;
        this.state.addFavText = 'Added'
    } else {
        heartStatus = emptyHeart;
        this.state.addFavText = 'Add to Favorites'
    }
    this.setState({
        imgSrc: heartStatus
    });
}
    render() {
        return(
        <div>
            <section id='mainContent'>
                <div className="pictureContainer">
                    <img src="http://www.happymumhappychild.co.nz/wp-content/uploads/2016/12/Honey-Glazed-Ham-LINK.jpg" alt="hamPic" className="mainPicture"/>
            </div>
                    <section id='splittingAnimation'>
                    <div className="splittingLine"></div>
                    <div className="splittingLine"></div>
                    </section>
            <div className="heartPic"><img src= {this.state.imgSrc} onClick={this.changeHeart}></img>
                    <p>{this.state.addFavText}</p>
            </div>
        </section>
            <section className="dishDetails">
                    <h1>Dish Name</h1>
                    <h3>Ready in: 45 mins</h3>
                </section>
            <section className="ingredients">
                    <ol>Ingredients
                        <li>1. Lorem ipsum </li>
                        <li>2. eget condimentum </li>
                        <li>3. Aenean at </li>
                        <li>4. Lorem ipsum </li>
                        <li>5. eget condimentum </li>
                        <li>6. Aenean at </li>
                    </ol>
                </section>
            <section className="directions">
                    <ol start= '1'>Directions
                        <li>t viverra diam at libero interdum, quis dignissim leo aliquam. Quisque quis scelerisque dui. Aenean justo mi, semper convallis massa ac, pulvinar mollis dolor. Suspendisse ris</li>
                        <li>nte aliquam et. Nullam egestas fringilla dapibus. Quisque eget metus odio. Duis ac ante auctor, consequat eros at, euismod tellus. Aliquam et cursus quam, sed lacinia tortor.</li>
                        <li>llis. Ut malesuada sapien sed varius ullamcorper. Praesent vestibulum, orci eget varius tristique, nisi magna vehicula sapien, mollis ullamcorper felis felis a justo. Aenean in vehicula est. Mauris feugiat orci ac neque finibus faucibus. Donec ac lacus aliquam, aliquet arcu id, imperdiet tellus. Ut consequat id arcu vitae placerat. </li>
                    </ol>
                </section>
                </div>

        )}
}

export default Recipe;


