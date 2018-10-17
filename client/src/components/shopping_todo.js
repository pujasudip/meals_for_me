import React, {Component} from 'react';
import {getShoppingList, shoppingStatus, deleteFromShoppingListServer} from '../actions';
import '../assets/css/shopping-todo.css';
import {connect} from 'react-redux';


class ShoppingToDo extends Component{
    constructor(props){
        super(props);
        this.userId = '';
    }
    componentDidMount(){
        if((typeof localStorage.userInfo !== undefined) && (typeof localStorage.userInfo !== "undefined")){
            this.userId = (JSON.parse(localStorage.userInfo))['user_id'];
        } else if((typeof this.props.userInfo !== undefined) && (typeof this.props.userInfo !== "undefined")) {
            this.userId = typeof this.props.userInfo.data.user_id;
        }
        if(this.userId !== ''){
            this.props.getShoppingList(this.userId);
        }
    }

    changeStatus(id, status, userId){
        let newStatus = '';
        if(status === 'complete'){
            newStatus = 'incomplete'
        } else {
            newStatus = 'complete';
        }
        this.props.shoppingStatus(id, newStatus, userId);
    }

    deleteFromShoppingList(user_id, recipe_id, item, id){
        this.props.deleteFromShoppingListServer(user_id, recipe_id, item, id);
    }

    render(){
        let shoppingList = '';
        console.log('list:', this.props.shoppingList);
        if(this.props.shoppingList){
            let linethrough = '';
            let btnStyle = '';
            let check = '';
            let status = '';
            shoppingList = this.props.shoppingList.map((ele, index)=>{
                if(ele.status === 'complete'){
                    linethrough = 'taskDone';
                    btnStyle = '';
                    check = 'check_box';
                    status = 'cancel';
                } else {
                    linethrough = '';
                    btnStyle = 'btnDone';
                    check = 'crop_din';
                    status = 'check';
                }
                return (
                    <li className="shopTodo" key={ele.id}>
                        <div className="sNo" onClick={()=>this.changeStatus(ele.id, ele.status, ele.user_id)}><i className="material-icons hide-on-small-and-down">{check}</i></div>
                        <div className={`item ${linethrough}`}>{ele.items}</div>
                        <div className="opBtn">
                            <div className="shopDel" onClick={()=>this.deleteFromShoppingList(ele.user_id, ele.recipe_id, ele.items, ele.id)}><i className="material-icons show-on-small hide-on-med-and-up">delete</i><span className="hide-on-small-only">Delete</span></div>
                            <div className={`shopDone ${btnStyle}`} onClick={()=>this.changeStatus(ele.id, ele.status, ele.user_id)}><i className="material-icons show-on-small hide-on-med-and-up">{status}</i><span className="hide-on-small-only">{ele.status}</span></div>
                        </div>
                    </li>
                )
            });
        }
        return (
            <div className="shopping-todo-container">
                <div className="sNos hide-on-small-and-down">
                    Status
                </div>
                <div className="items">
                    Items
                </div>
                <div className="operations">
                    Operations
                </div>
                <ul>
                    {shoppingList}
                </ul>
            </div>
        )
    }
}

function mapStateToProps(state){
    return ({
        shoppingList: state.shoppingList.shoppingListServer
    });
}

export default connect(mapStateToProps, {getShoppingList, shoppingStatus, deleteFromShoppingListServer})(ShoppingToDo);