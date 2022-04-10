import React from 'react';
import classes from './choice.module.css';

const Choice = props => {

    return (
        <div onClick={()=>props.startServoMode(mode)} className={classes.choice}>
            <img 
                className={classes.choiceImg} 
                src={beginner} 
                style={{marginTop:'5%'}} 
                height={60} 
                width={60} />
            <p className={classes.choiceText}>props.title</p>
        </div>
    );
};

export default Choice;