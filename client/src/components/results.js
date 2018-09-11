import React, { Component } from 'react';
import '../assets/css/results.css'
import lf_image from "../assets/images/leaf_board.png";
import axios from 'axios';
import OneResult from './individual_result_panel';
import { connect } from 'react-redux';
import { formatPostData, formatQueryString } from '../helpers';
import { searchedRecipe, setDetailsOfItem, setDetailsId } from '../actions';

class Results extends Component {
    constructor(props) {
        super(props);
        this.state = {
            resultArray: ''
        }
        // this.handleOnScroll = this.handleOnScroll.bind(this);
    }

    componentDidMount() {
        // window.addEventListener('scroll', this.handleOnScroll);
        // console.log(this.props.searchedRecipe(this.props.userInputs), "@@@@@@")
        this.props.searchedRecipe(this.props.userInputs);
    }

    // displayMore(){
        
    // }
    // handleOnScroll() {
    //     // debugger;
    //     let scrollTop = (document.documentElement && document.documentElement.scrollTop) || document.body.scrollTop;
    //     let scrollHeight = (document.documentElement && document.documentElement.scrollHeight) || document.body.scrollHeight;
    //     let clientHeight = document.documentElement.clientHeight + 1 || window.innerHeight; // changed client height to + 1
    //     let scrolledToBottom = (parseInt(scrollTop + clientHeight)) >= scrollHeight;
    //     if (scrolledToBottom) {
    //         this.props.searchedRecipe(this.props.userInputs);
    //     }
    // }
    render() {
        // debugger;
        console.log('inputs 1:', this.props.userInputs);
        console.log(this.props.searchedIngredients, "Check how many times")
        let searchedIngredients = '';
           searchedIngredients = this.props.searchedIngredients;


        let resultArray = '';   
        if (searchedIngredients.length <= 0) {
            return (
                <div><i className="fa fa-spinner fa-pulse fa-3x fa-fw"></i><span className="sr-only">Loading...</span></div>
            );
        } else if (typeof (searchedIngredients[0]) === 'object') {
            console.log(searchedIngredients, "testing");
            console.log(typeof (searchedIngredients[0]));
            
            resultArray = searchedIngredients.map((ele, index) => {
                return (
                    <OneResult key={ele.ID} id={ele.ID} title={ele.Name} details={ele} likes={ele.likes} imageSrc={ele.Image} />
                );
            });
        } else {
            return (
                <div>GO BACK!</div>
            )
        }

        return (
            <div>
                <h5>Results for: {this.props.userInputs.join(", ")}</h5>
                    {
                        resultArray
                    }      
                {/* <button type='text' onClick={this.displayMore}>Display More</button> */}
            </div>
        )
    }
}

function mapStateToProps(state){
    return {
        userInputs: state.search.ingredients,
        searchedIngredients: state.search.searched_recipe
    }
}

export default connect(mapStateToProps, { searchedRecipe, setDetailsOfItem, setDetailsId })(Results);