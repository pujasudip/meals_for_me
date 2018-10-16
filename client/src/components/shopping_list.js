import React, { Component } from 'react';
import { connect } from 'react-redux';
import { removeFromShoppingList, getShoppingList, deleteFromShoppingListServer } from '../actions'

class ShoppingList extends Component{
    constructor(props){
        super(props);
        this.userId = '';
    }
    componentDidMount(){
        if((typeof localStorage.userInfo !== undefined) && (typeof localStorage.userInfo !== "undefined")){
            this.userId = (JSON.parse(localStorage.userInfo))['user_id'];
        } else if((typeof this.props.userInfo.data !== undefined) && (typeof this.props.userInfo.data !== "undefined")) {
            this.userId = typeof this.props.userInfo.data.user_id;
        }
        if(this.userId !== ''){
            this.props.getShoppingList(this.userId);
        }
    }
    removeItemFromServer(user_id, recipe_id, item, shopId){
        this.props.deleteFromShoppingListServer(user_id, recipe_id, item, shopId);
    }
    render(){
        let list = '';
        if(this.userId !== '' ){
            if(typeof this.props.shoppingListServer !== "undefined"){
                list = this.props.shoppingListServer.map((ele)=>{
                    return <li key={ele.id} onClick={()=>this.removeItemFromServer(ele.user_id, ele.recipe_id, ele.items, ele.id)}>{ele.items}</li>
                });
            }
        } else if(this.props.shoppingList){
            list = this.props.shoppingList.map((ele, index)=>{
                return <li onClick={()=>this.props.removeFromShoppingList(ele)} key={index}>{ele}</li>
            });

        }

        return (
            <section className="shopping_list">
                <ul start= '1'>Shopping List
                    {list}
                </ul>
            </section>
        );
    }
}

function mapStateToProps(state){
    return {
        shoppingList: state.shoppingList.shoppingList,
        shoppingListServer: state.shoppingList.shoppingListServer
    }
}

export default connect(mapStateToProps, {removeFromShoppingList, getShoppingList, deleteFromShoppingListServer})(ShoppingList);