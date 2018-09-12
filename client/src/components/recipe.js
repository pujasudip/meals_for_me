import React, {Component} from 'react';
import '../assets/css/recipe.css';
import emptyHeart from '../assets/images/heart-outline.png';
import redHeart from '../assets/images/heart-icon-red.png';
import Directions from './directions';
import Ingredients from './ingredients';
import ShoppingList from './shopping_list';
import { connect } from 'react-redux';
import { getDetailsById, addToShoppingList } from '../actions';
import wine_up from '../assets/images/wine_up.png';

class Recipe extends Component {
    constructor(props) {
        super(props);
        this.state = {
            imgSrc: emptyHeart,
            addFavText: 'Add to Favorites',
            component: 'Ingredients',
        }
        this.handleSelect = this.handleSelect.bind(this);
    }

    componentDidMount(){
        const id =  this.props.match.params.id;
        this.props.getDetailsById(id);
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

    dynamicComponent(directions, ingredients){
        const comp = this.state.component;

        switch(comp){
            case 'Directions':
                return <Directions directions={directions}/>;
            case 'ShoppingList':
                return <ShoppingList />;
        }
    }

    setStateForComponentRender(comp){
        this.setState({
            component: comp
        });
    }

    dietOptions(diet){
        console.log('inside of diet options method', diet)
        if(diet === 1){
            return 'True';
        }else{
            return 'False';
        }
    }

    addToShopingList(item){
        this.props.addToShoppingList(item.name);
    }

    render() {
        let directions = '';
        let ingredients = '';
        let pairedWines = '';
        console.log('props in recipe', this.props)
        if(this.props.details){
            directions = this.props.details.data.data[0];
            ingredients = JSON.parse(directions.Ingredients);
            pairedWines = JSON.parse(directions.winepairings).pairedWines;
        }
        let ingredientList = '';
        let wineList = '';
        console.log('det:', pairedWines);

        if(ingredients){
            ingredientList = ingredients.map((ele)=>{
                return <li key={ele.id} onClick={this.addToShopingList.bind(this, ele)}>{ele.original}</li>
            });
        }
        if(pairedWines){
            wineList = pairedWines.map((ele, index)=>{
                return <li key={index}>{ele}</li>
            });
        }

        return(
        <div>
            { this.props.details ?
                <div>
            <section id='mainContent'>
                <div className="pictureContainer">
                    <img src={directions.Image} alt="hamPic" className="mainPicture"/>
            </div>
                    <section id='splittingAnimation'>
                    <div className="splittingLine"></div>
                    <div className="splittingLine"></div>
                    </section>
            <div className="heartPic"><img src= {this.state.imgSrc} onClick={this.changeHeart}></img>
                    <p>{this.state.addFavText}</p>
            </div>
        </section>
            <section className="dishDetails center">
                <h1>{directions.Name}</h1>
                <h3>Prep & Cooking Time: {directions.Time} mins</h3>
                <p>Vegan: {this.dietOptions(directions.vegan)}</p>
                <p>Vegetarian: {this.dietOptions(directions.vegetarian)}</p>
            </section>
        <div>
            <Ingredients ingredients={ingredientList} />
        </div>
            <div className='row s12 tabs'>
                <div className='tab col s4 center' title='Directions' onClick={()=>this.setStateForComponentRender('Directions')}>Directions</div>
                <div className='tab col s4' title='ShoppingList' onClick={()=>this.setStateForComponentRender('ShoppingList')}>Shopping List</div>
            </div>
            <div>
                {this.dynamicComponent(directions, ingredientList)}
            </div>
            <div className='wine_pairing_slider valign-wrapper'>
                <i className='material-icons medium wineNavLeft'>navigate_before</i>
                <div>
                    <ul>
                        {wineList}
                    </ul>
                </div>
            </div>
                </div> : ""}

        </div>
        )}
}

function mapStateToProps(state){
    return {
        details: state.search.details,
    }
}


export default connect(mapStateToProps, {getDetailsById, addToShoppingList})(Recipe);


