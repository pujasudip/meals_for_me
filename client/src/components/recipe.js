import React, {Component} from 'react';
import '../assets/css/recipe.css';
import emptyHeart from '../assets/images/heart-outline.png';
import redHeart from '../assets/images/heart-icon-red.png';
import Directions from './directions';
import Nutrition from './nutrition';
import ShoppingList from './shopping_list';

class Recipe extends Component {
    constructor(props) {
        super(props);
        this.state = {
            imgSrc: emptyHeart,
            addFavText: 'Add to Favorites',
            component: 'Directions'
        }
        this.handleSelect = this.handleSelect.bind(this);
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
    handleSelect(key) {
        alert(`selected ${key}`);
        this.setState({ key: key });
    }

    dynamicComponent(){
        const comp = this.state.component;

        switch(comp){
            case 'Directions':
                return  <Directions />;
            case 'Nutrition':
                return <Nutrition />;
            case 'ShoppingList':
                return <ShoppingList />;
        }
    }

    setStateForComponentRender(comp){
        this.setState({
            component: comp
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
            <div className='row s12'>
                <div className='tab col s4 center' title='Directions' onClick={()=>this.setStateForComponentRender('Directions')}>Directions</div>
                <div className='tab col s4 center' title='Nutrition' onClick={()=>this.setStateForComponentRender('Nutrition')}>Nutritions</div>
                <div className='tab col s4' title='ShoppingList' onClick={()=>this.setStateForComponentRender('ShoppingList')}>Shopping List</div>
            </div>
            <div>
                {this.dynamicComponent()}
            </div>
            <div className='wine_pairing_slider'>
                <i className='material-icons prefix'>navigate_before</i><span className='white-text'>Paired Wines</span>
            </div>

        </div>

        )}
}


export default Recipe;


