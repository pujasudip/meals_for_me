import React, { Component } from 'react';
import '../assets/css/results.css'
import axios from 'axios';
import OneResult from './individual_result_panel';
import { connect } from 'react-redux';
import { formatPostData, formatQueryString } from '../helpers';
import { searchedRecipe, setDetailsOfItem, setDetailsId } from '../actions';
import '../../node_modules/font-awesome/css/font-awesome.min.css';

const BASE_URL = 'http://localhost:8000/server/getData.php';

class Results extends Component {
    constructor(props) {
        super(props);
        this.state = {
            resultArray: '',
            page: 0
        }
        this.handleOnScroll = this.handleOnScroll.bind(this);
    }

    componentDidMount() {
        window.addEventListener('scroll', this.handleOnScroll);
        // console.log(this.props.searchedRecipe(this.props.userInputs), "@@@@@@")
        console.log('compoennet did mount called data')
        this.props.searchedRecipe(this.props.userInputs, 0);
    }

    componentWillUnmount() {
        window.removeEventListener('scroll', this.handleOnScroll);
    }

    // displayMore(){
        
    // }
    handleOnScroll() {
        // debugger;
        let scrollTop = (document.documentElement && document.documentElement.scrollTop) || document.body.scrollTop;
        let scrollHeight = (document.documentElement && document.documentElement.scrollHeight) || document.body.scrollHeight;
        let clientHeight = document.documentElement.clientHeight + 1 || window.innerHeight; // changed client height to + 1
        let scrolledToBottom = (parseInt(scrollTop + clientHeight)) >= scrollHeight;
        if (scrolledToBottom) {
            console.log('scrolled to bottom')
            console.log(this.props.userInputs)
            this.props.searchedRecipe(this.props.userInputs, 1);
            this.setState({
                page: this.state.page + 1
            })
        }
    }
    render() {
        debugger;
        const { searchedIngredients } = this.props;
        console.log(searchedIngredients);
        let resultArray = '';
        if(!this.props.userInputs.length){
            return <div>Go Back</div>
        }
        //if on load
        if (searchedIngredients.length <= 0) {
            
            return (
                <div><i className="fa fa-spinner fa-pulse fa-3x fa-fw"></i><span className="sr-only">Loading...</span></div>
            );
        // when valid search
        } else if (typeof (searchedIngredients.data[0]) === 'object') {
            resultArray = searchedIngredients.data.map((ele, index) => {
                return (
                    <OneResult key={ele.ID} id={ele.ID} title={ele.Name} details={ele} likes={ele.likes} imageSrc={ele.Image} />
                );
            });
        // if it is an invalid search
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