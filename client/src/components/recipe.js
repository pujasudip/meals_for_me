import React, {Component} from 'react';
import '../assets/css/recipe.css';
import emptyHeart from '../assets/images/heart-outline.png'
import redHeart from '../assets/images/heart-icon-red.png'

class Recipe extends Component {
    constructor(props) {
        super(props);
        this.state = {
            imgSrc: emptyHeart
        }
    }
changeHeart = ()=>{
    let heartStatus;
    if(this.state.imgSrc === emptyHeart){
        heartStatus = redHeart;
        
    } else {
        heartStatus = emptyHeart;
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
            <div className="heartPic"><img src= {this.state.imgSrc} onClick={this.changeHeart}></img></div>
        </section>
            <section className="dishDetails">
                    <h1>Dish Name</h1>
                    <h3>Ready in: 45 mins</h3>
                </section>
            <section className="ingredients">
                    <ol>Ingredients
                        <li>1. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed accumsan risus ac iaculis tincidunt. Ut dignissim metus in euismod lobortis. Praesent convallis, ligula rhoncus elementum mattis</li>
                        <li>2. eget condimentum enim nisl a libero. Integer at lorem massa. Cras porttitor tincidunt tellus a accumsan. Phasellus eu dui ultricies, luctus felis eu, venenatis mi. Quisque in facilisis dui.</li>
                        <li>3. Aenean at sapien vel purus facilisis blandit. Aliquam erat volutpat. Mauris sed arcu dapibus, varius urna sit amet, iaculis tortor. Quisque condimentum nisi et placerat efficitur. Donec ornar</li>
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


