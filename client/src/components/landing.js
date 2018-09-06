import React, { Component } from 'react';
import '../assets/css/landing.css';
import plus from '../assets/images/plus.png';
import minus from '../assets/images/minus.png';
import { Link } from 'react-router-dom';
import { connect } from 'react-redux';
import { searchIngredient, addIngredeints, removeIngredients, clearUserIngredientInputs } from '../actions';
import bg_image from '../assets/images/bg.jpg';
//import bg_image from '../assets/images/dogbg.jpg';
import slogan from '../assets/images/chicken_soup.gif';
import commonIngredientsRef from '../assets/dummy_data/commonIngredientsRef';

class LandingPage extends Component {
    foodIndex = 0;
    allowedEntries = 3;

    constructor(props) {
        super(props);
        this.state = {
            currentIngredientInput: '',
            commonIngredients: commonIngredientsRef[this.foodIndex].food,
            remainingEntries: this.allowedEntries,
        };
    }

    componentDidMount() {
        document.body.style.backgroundColor = '#FEFAE0';
    }

    userInputHandler(event) {
        this.setState({
            currentIngredientInput: event.target.value
        });
    }

    addIngredientToListFromInput(event) {
        let item = '';

        if (event.target) {
            item = this.state.currentIngredientInput.toLowerCase();
            if(item.length === 0){
                return;
            }
        }
        this.setState({
            currentIngredientInput: '',
            remainingEntries: --this.allowedEntries,
        });

        this.props.addIngredient(item);

    }

    addIngredientToListFromButton(item){
        this.props.addIngredient(item);
        this.setState({
            remainingEntries: --this.allowedEntries,
        });
        this.commonFoodCarousel('right');
    }

    removeFromTheIngredient(item) {
        let index = this.props.ingredients.indexOf(item);
        console.log('index: ', index);
        this.setState({
            remainingEntries: ++this.allowedEntries,
        });
        this.props.removeIngredient(index);
        console.log('aaa:', this.props.ingredients.length);
    }

    clearUserInputs(){
        this.props.clearUserIngredientInputs();
    }

    commonFoodCarousel(direction){
        switch(direction){
            case 'left':
                this.foodIndex--;
                if(this.foodIndex < 0){
                    this.foodIndex++;
                    return;
                }
                break;
            case 'right':
                this.foodIndex++;
                if(this.foodIndex > 2){
                    this.foodIndex--;
                    return;
                }
                break;
            default:
                return;
        }

        this.setState({
            commonIngredients: commonIngredientsRef[this.foodIndex].food,
        });
    }

    goToResultsPage = () => {
        if(this.props.ingredients.length !== 0){
            this.props.history.push('/results');
        }
    }

    render() {
        const colorArray = ['#ff8a80 red accent-1','#90caf9 blue lighten-3', '#e8f5e9 green lighten-3'];
        const ingredient = this.props.ingredients.map((item, index) => {
            return (<div key={index} className='ingredients'>
                <div className='chip'>
                    <div className="valign-wrapper">
                        {item}
                        <i className="material-icons" onClick={() => this.removeFromTheIngredient(item)}>close</i>
                    </div>
                </div>
            </div>);
        });


        const commonIngredientsBtns = this.state.commonIngredients.map((item, index) => {
            return (<button className={`btn btn-flat ${colorArray[this.foodIndex]}`} onClick={() => this.addIngredientToListFromButton(item, index)} key={index}>{item}</button>)
        });

        let hideBubbles = ()=> {
            if (this.props.ingredients.length === 3) {
                return {'display': 'none'};
            }
        };

        return (
            <div className='center'>
                <div className='text center'>
                    <h1>Enter your Ingredients</h1>
                </div>
                <div className="center">
                    {ingredient}
                </div>
                {this.props.ingredients.length < 3 ?
                    <div className='search_field'>
                        <div className="">
                            <input placeholder={`Insert ${this.state.remainingEntries} more Ingredients`} className='center' onChange={(event) => this.userInputHandler(event)} value={this.state.currentIngredientInput} />
                        </div>
                        <img id="ingAddMinImg" src={plus} onClick={this.addIngredientToListFromInput.bind(this)} className="center-block"/>
                    </div>
                    :
                    <div className='center purple-text'><h5>Go for the food</h5></div>
                }
                {this.props.ingredients.length < 3 ?
                    <div className="ingredientBtns">
                        <div>
                            <h5 className="commonFoodHeader">Common Choices</h5>
                        </div>
                        <div className="row s12 valign-wrapper">
                            <div className="col s2">
                                <i className="material-icons medium directionLeft" onClick={this.commonFoodCarousel.bind(this, 'left')}>chevron_left</i>
                            </div>
                            <div className="col s8 center">
                                {commonIngredientsBtns}
                            </div>
                            <div className="col s2">
                                <i className="material-icons medium directionRight" onClick={this.commonFoodCarousel.bind(this, 'right')}>chevron_right</i>
                            </div>
                        </div>
                    </div>
                    : ''
                }
                <div>
                    <div className="center" style={hideBubbles()}>
                        <div className={this.foodIndex === 0 ? 'commonFoodBubbleActive' : 'commonFoodBubble'}>
                        </div>
                        <div className={this.foodIndex === 1 ? 'commonFoodBubbleActive' : 'commonFoodBubble'}>
                        </div>
                        <div className={this.foodIndex === 2 ? 'commonFoodBubbleActive' : 'commonFoodBubble'}>
                        </div>
                    </div>
                    <div className="landPgSearchBtn btn btn-block center-block" onClick={this.goToResultsPage}>Search</div>
                    <div className='center' style={this.props.ingredients.length !== 3 ? { 'display': 'none' } : {}}>
                        <button type='button' className='btn btn-flat clearBtn waves-effect' onClick={() => this.clearUserInputs()}>Clear Inputs</button>
                    </div>
                </div>
            </div>
        );
    }
}

function mapStateToProps(state){
    return {
        ingredients: state.search.ingredients
    }

}

const mapActionsToProps = {
    searchIngredient: searchIngredient,
    addIngredient: addIngredeints,
    removeIngredient: removeIngredients,
    clearUserIngredientInputs: clearUserIngredientInputs
};

export default connect(mapStateToProps, mapActionsToProps)(LandingPage);