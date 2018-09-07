import React, {Component} from 'react';
import '../assets/css/recipe.css';
import emptyHeart from '../assets/images/heart-outline.png';
import redHeart from '../assets/images/heart-icon-red.png';
import Directions from './directions';
import Nutrition from './nutrition';
import ShoppingList from './shopping_list';
import { connect } from 'react-redux';
import { getDetailsById } from '../actions';

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

    dynamicComponent(directions){
        const comp = this.state.component;

        switch(comp){
            case 'Directions':
                return  <Directions directions={directions}/>;
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
        let directions = '';
        let ingredients = '';
        if(this.props.details){
            directions = this.props.details.data.data[0];
            ingredients = JSON.parse(directions.Ingredients);
        }
        let ingredientList = '';


        if(ingredients){
            ingredientList = ingredients.map((ele)=>{
                return <li key={ele.ID}>{ele.original}</li>
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
            <section className="dishDetails">
                    <h1>{directions.Name}</h1>
                    <h3>Ready in: {directions.Time} mins</h3>
                </section>
            <section className="ingredients">
                    <ol>Ingredients
                        {ingredientList}
                    </ol>
                </section>
            <div className='row s12'>
                <div className='tab col s4 center' title='Directions' onClick={()=>this.setStateForComponentRender('Directions')}>Directions</div>
                <div className='tab col s4 center' title='Nutrition' onClick={()=>this.setStateForComponentRender('Nutrition')}>Nutritions</div>
                <div className='tab col s4' title='ShoppingList' onClick={()=>this.setStateForComponentRender('ShoppingList')}>Shopping List</div>
            </div>
            <div>
                {this.dynamicComponent(directions)}
            </div>
            <div className='wine_pairing_slider'>
                <i className='material-icons prefix'>navigate_before</i><span className='white-text'>Paired Wines</span>
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


export default connect(mapStateToProps, {getDetailsById})(Recipe);


