import React, { Component } from 'react';
import '../assets/css/landing.css';
import plus from '../assets/images/plus.png';
import minus from '../assets/images/minus.png';
import { Link } from 'react-router-dom';
import { connect } from 'react-redux';
import { clearRecipes, searchIngredient, addIngredeints, removeIngredients, clearUserIngredientInputs } from '../actions';
import bg_image from '../assets/images/mobile-bg.png';
//import bg_image from '../assets/images/dogbg.jpg';
import commonIngredientsRef from '../assets/dummy_data/commonIngredientsRef';
import types from "../actions/types";
import { userLogin, setPageNo, clearSearchedRecipe } from '../actions';
import pageReducer from "../reducers/page_no_reducer";

class LandingPage extends Component {
    foodIndex = 0;

    constructor(props) {
        super(props);
        this.state = {
            currentIngredientInput: '',
            commonIngredients: commonIngredientsRef[this.foodIndex].food,
            zoomBackground: '',
            inputError: '',
            toastMessage: 'hideToast',
            nothingEntered: 'nothingEnteredIsFalse',
            emptyInputField: 'emptyInputFieldFalse'
        };
    }
    componentDidMount() {
        if(!this.props.nullSearch){
            this.props.clearUserIngredientInputs();
        }
        this.props.setPageNo(0);
    }
//     componentWillUnmount(){
//         this.props.clearRecipes();

//     }
    componentWillUnmount() {
        this.props.clearSearchedRecipe();
        this.props.setPageNo(0);
    }

    componentWillReceiveProps(newProp) {
        // console.log(newProp,'new prop from LP')
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
            if (item.length === 0) {
                this.setState({
                    emptyInputField: 'emptyInputFiled'
                });
                setTimeout(()=>{
                    this.setState({
                        emptyInputField: 'emptyInputFieldFalse'
                    });
                }, 2000);
                return;
            }
        }

        let itemArray = item.split(',');

        if(itemArray.length === 1){
            this.props.addIngredient(item);
        } else if(itemArray.length > 3){
            this.setState({
                toastMessage: ''
            });
            setTimeout(()=>{
                this.setState({
                    currentIngredientInput: '',
                    toastMessage: 'hideToast'
                });
            }, 2000);
            return;
        } else {
            for(let i = 0; i < itemArray.length; i++){
                this.props.addIngredient(itemArray[i]);
            }
        }
        this.setState({
            currentIngredientInput: '',
        });
    }

    addIngredientToListFromButton(item) {
        this.props.addIngredient(item);
        this.commonFoodCarousel('right');
    }

    removeFromTheIngredient(item) {
        let index = this.props.ingredients.indexOf(item);
        this.props.removeIngredient(index);
    }

    clearUserInputs() {
        this.props.clearUserIngredientInputs();
    }

    commonFoodCarousel(direction) {
        switch (direction) {
            case 'left':
                this.foodIndex--;
                if (this.foodIndex < 0) {
                    this.foodIndex = 4;
                }
                break;
            case 'right':
                this.foodIndex++;
                if (this.foodIndex > 4) {
                    this.foodIndex = 0;
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
        if (this.props.ingredients.length !== 0) {
            if(this.props.ingredients.length === 1){
                this.props.history.push('/results/' + `${this.props.ingredients[0]}`);
            } else if (this.props.ingredients.length === 2) {
                this.props.history.push('/results/' + `${this.props.ingredients[0]}` + '/' + `${this.props.ingredients[1]}`);
            } else if (this.props.ingredients.length === 3) {
                this.props.history.push('/results/' + `${this.props.ingredients[0]}` + '/' + `${this.props.ingredients[1]}` + '/' + `${this.props.ingredients[2]}`);
            }

        } else {
            this.setState({
                nothingEntered: 'nothingEntered'
            });
            setTimeout(()=>{
                this.setState({
                    nothingEntered: 'nothingEnteredIsFalse'
                });
            }, 2000);
        }
    }

    randomAccessCommonFood(index){
        this.foodIndex = index;
        this.setState({
            commonIngredients: commonIngredientsRef[this.foodIndex].food,
        });
    }

    render() {

        const colorArray = ['red accent-1', 'orange accent-1', 'green lighten-3','red lighten-4','amber accent-1'];
        const ingredient = this.props.ingredients.map((item, index) => {
            return (<div key={index} className='ingredientsLandPg'>
                <div className='chip'>
                    <div className="valign-wrapper">
                        {item}
                        <i className="material-icons clickPointer" onClick={() => this.removeFromTheIngredient(item)}>close</i>
                    </div>
                </div>
            </div>);
        });


        const commonIngredientsBtns = this.state.commonIngredients.map((item, index) => {
            return (<button className={`btn btn-flat ${colorArray[this.foodIndex]}`} onClick={() => this.addIngredientToListFromButton(item, index)} key={index}>{item}</button>)
        });

        let hideBubbles = () => {
            if (this.props.ingredients.length === 3) {
                return { 'display': 'none' };
            }
        };

        return (
            <div className="center bgImg" style={{ backgroundImage: `url(${bg_image})` }}>
                <div className="main">
                    <div className="userActivity center-block">
                        <div className='text center'>
                            <h5 className='margin-top-zero inputFieldHeader' style={this.props.ingredients.length === 3 ? { 'display': 'none' } : {}}>Enter your Ingredients</h5>
                        </div>
                        <div className="center">
                            {ingredient}
                        </div>
                        {this.props.ingredients.length < 3 ?
                            <div className='search_field'>
                                <div className="">
                                    <input placeholder={this.props.ingredients.length === 0 ?`Insert up to 3 Ingredients` : `Insert ${3 - this.props.ingredients.length} more Ingredients`}
                                           className='ingInput center' onChange={(event) => this.userInputHandler(event)}
                                           value={this.state.currentIngredientInput} />
                                    <i id="ingAddImg" onClick={this.addIngredientToListFromInput.bind(this)} className="material-icons center-block">add_circle_outline</i>
                                </div>
                            </div>
                            :
                            <div className='center black-text'><h4>Go for the food</h4></div>
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
                                <div onClick={()=>this.randomAccessCommonFood(0)} className={this.foodIndex === 0 ? 'commonFoodBubbleActive' : 'commonFoodBubble'}>
                                </div>
                                <div onClick={()=>this.randomAccessCommonFood(1)} className={this.foodIndex === 1 ? 'commonFoodBubbleActive' : 'commonFoodBubble'}>
                                </div>
                                <div onClick={()=>this.randomAccessCommonFood(2)} className={this.foodIndex === 2 ? 'commonFoodBubbleActive' : 'commonFoodBubble'}>
                                </div>
                                <div onClick={()=>this.randomAccessCommonFood(3)} className={this.foodIndex === 3 ? 'commonFoodBubbleActive' : 'commonFoodBubble'}>
                                </div>
                                <div onClick={()=>this.randomAccessCommonFood(4)} className={this.foodIndex === 4 ? 'commonFoodBubbleActive' : 'commonFoodBubble'}>
                                </div>
                            </div>
                            <div className="landPgSearchBtn btn btn-block center-block" onClick={this.goToResultsPage}>Search</div>
                            <div className='center' style={this.props.ingredients.length !== 3 ? { 'display': 'none' } : {}}>
                                <div className='btn btn-block clearBtn waves-effect' onClick={() => this.clearUserInputs()}>Clear Inputs</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div className={`ingredientInputError ${this.state.toastMessage}`}>
                    <p>Enter only three ingredients.</p>
                </div>
                <div className={`nothingEntered ${this.state.nothingEntered}`}>
                    <p>Enter ingredient to start your search.</p>
                </div>
                <div className={`emptyInputField ${this.state.emptyInputField}`}>
                    <p>Input field is empty.</p>
                </div>
            </div>
        );
    }
}

function mapStateToProps(state) {
    return {
        ingredients: state.search.ingredients,
        nullSearch: state.search.searched_recipe_null
    }

}

const mapActionsToProps = {
    searchIngredient: searchIngredient,
    addIngredient: addIngredeints,
    removeIngredient: removeIngredients,
    clearUserIngredientInputs: clearUserIngredientInputs,
    setPageNo: setPageNo,
    clearSearchedRecipe: clearSearchedRecipe,
};

export default connect(mapStateToProps, mapActionsToProps)(LandingPage);