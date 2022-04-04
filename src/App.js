import React, {useState} from 'react';
import classes from './app.module.css'


import sun from './assets/pics/sol.png'
import stop from './assets/pics/catStop.png';
import beginner from './assets/pics/catBeginner.png';
import intermediate from './assets/pics/catIntermediate.png';
import advanced from './assets/pics/catAdvanced.png';


const api = `http://${process.env.REACT_APP_MACHINE_HOST_IP}:5000`

const App = () => {

  const [conn, setConn] = useState(false);
  const [connColor, setConnColor] = useState("red");
  const [mode, setMode] = useState(null);

  const validateConn = async () => {

    console.log("checking connection...");

    await fetch(`${api}/`)
      .then(res => res.json())
      .then(res => {
        if (res.connection_status = "connected") {
          setConn( res.connection_status )
          setConnColor( "green" )
        }
      })
      .catch((error) => {
        console.log(error)
      });

  }

  /** start servo function */
  const startServoMode = async (mode) => {

    console.log(`starting servo on mode ${mode}`)

    await fetch(`${api}/start?mode=${mode}`)
    .then(res => res.json())
    .then(res => {
      setMode(mode)
    })
    .catch((error) => {
      console.log(error)
    });

  }

  /** kill servo */
  const killServo = async (mode) => {
    console.log("killing servo...")

    await fetch(`${api}/kill_all`)
    .then(res=>res.json())
    .then(res => {
      console.log(res);
    })
    .catch((error) => {
      console.log(error)
    });
  }

  /** test connection */
  validateConn();

  console.log(process.env.REACT_APP_MACHINE_HOST_IP)

  return (
    <div 
    className={classes.container}
      //id="animate-area"
    >

    

        {/** BRAND */}
        <div className={classes.brandContainer}>
          <div className={classes.brandMain}>
            <p>The Magic Cat Wand</p>
          </div>
        </div>

        <div className={classes.brandSubContainer}>
          <p className={classes.brandSub}>By Faustian</p>
          <img className={classes.brandImg} src={sun} height={50} width={50} />
          <p className={classes.brandSub}>Industries</p>
        </div>

     

        {/** CONNECTION STATUS BOX */}
        <div className={classes.connContainer}>
          <p style={{color: connColor}}>{`Status: ${conn ? conn : `not connected`}`}</p>
        </div>
 
    



 
        {/** OPTIONS */}
        {/* <div className={classes.title}>Choose your mode below</div> */}

        <div className={classes.choiceContainer}>
          <div onClick={()=>killServo()} className={classes.choice}>
            <img className={classes.choiceImg} src={stop}  style={{marginTop:'5%'}} height={60} width={60} />
            <p className={classes.choiceText}>Stop</p>
          </div>
        
          <div onClick={()=>startServoMode("beginner")} className={classes.choice}>
            <img className={classes.choiceImg} src={beginner} style={{marginTop:'5%'}} height={60} width={60} />
            <p className={classes.choiceText}>Beginner</p>
          </div>
          <div onClick={()=>startServoMode("intermediate")} className={classes.choice}>
          <img className={classes.choiceImg} src={intermediate} style={{marginTop:'5%'}} height={60} width={60} />
            <p className={classes.choiceText}>Adventurous</p>
          </div>
          <div onClick={()=>startServoMode("advanced")} className={classes.choice}>
          <img className={classes.choiceImg} src={advanced} style={{marginTop:'5%'}} height={60} width={60} />
            <p className={classes.choiceText}>Nut Job</p>
          </div>
        </div>



        

       
    </div>
  );
};

export default App;