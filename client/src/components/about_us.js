import React, { Component } from 'react';
import '../assets/css/about_us.css';
import Member from './member';
import leah from '../assets/images/leah.png';
import sudip from '../assets/images/sudip-min.jpg';
import sean from '../assets/images/sean-min.jpg';
import josh from '../assets/images/josh-min.jpg';


class AboutUs extends Component {
    constructor(props) {
        super(props);
        this.members = [
            { name: 'Leah Choi', github: 'a.a', linkedin: 'l.l', image: leah},
            { name: 'Josh Sohn', github: 'a.a', linkedin: 'l.l', image: josh},
            { name: 'Sudip Baral', github: 'https://github.com/pujasudip', linkedin: 'https://www.linkedin.com/in/sudip-baral-5a2a96113/', image: sudip},
            { name: 'Sean Prouty', github: 'a.a', linkedin: 'l.l', image: sean},
        ];
        this.state = {
            modalClass: 'hideModal',
            pageToDisplay: ''
        }
    }

    clickHandler(link){
        this.setState({
            modalClass: this.state.modalClass === 'showModal' ? 'hideModal' : 'showModal',
            pageToDisplay: link
        });
    }

    render() {
        const member = this.members.map((element, index)=>{
            return (
                <Member key={index}
                        name={element.name}
                        github={element.github}
                        linkedin={element.linkedin}
                        image={element.image}
                        clicked={this.clickHandler.bind(this)}/>
            );
        });
        return (
            <div>
                <div>
                    {member}
                </div>
                <div className={this.state.modalClass}>
                   <div className='inner-content-modal'>
                       <i className='material-icons close' onClick={()=>this.clickHandler()}>close</i>
                       <div className='webpage'>
                           <div>
                               <iframe src={this.state.pageToDisplay}></iframe>
                           </div>
                       </div>
                   </div>
                    <div>
                        <button className='btn btn-small modalBtn center' onClick={()=>this.clickHandler()}>Close</button>
                    </div>
                </div>
            </div>
        )
    }
}

export default AboutUs;
