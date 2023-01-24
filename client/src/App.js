// NEW: Import the useEffect hook
// npm install bootstrap@5.2.3

import { useState, useEffect } from "react";
import { BrowserRouter as Router, Route, Routes, Navigate } from "react-router-dom";
import jwtDecode from "jwt-decode";
import Confirmation from "./Utilities/Confirmation";
import Error from "./Utilities/Error";
import Home from "./Utilities/Home";
import NavBar from "./Utilities/NavBar";
import NotFound from "./Utilities/NotFound";
import HikeForm from "./Hike/HikeForm";
import Login from "./Utilities/Login";
import Profile from "./Utilities/Profile";
import AuthContext from "./context/AuthContext";
import CardFactory from "./Hike/CardFactory";
import About from "./Utilities/About";
import Register from "./Utilities/Register";

// NEW: Define a variable for the localStorage token item key
const LOCAL_STORAGE_TOKEN_KEY = "hikeHikingToken";

function App() {

  const [hikes, setHikes] = useState([]);

  const [trails, setTrails] = useState([]);

  const [hikers, setHikers] = useState([]);

  const [currentUser, setCurrentUser] = useState(null);

  const [restoreLoginAttemptCompleted, setRestoreLoginAttemptCompleted] = useState(false);

    const getAllTrails = () => {
        fetch("http://localhost:8080/trail")
        .then((response) => response.json())
        .then((data) => setTrails(data));
    }

    const getAllHikers = () => {
        fetch("http://localhost:8080/hiker")
        .then((response) => response.json())
        .then((data) => setHikers(data));
    }

  useEffect(() => {
    getAllTrails();
    getAllHikers();
  }, [])

  useEffect(() => {
    const token = localStorage.getItem(LOCAL_STORAGE_TOKEN_KEY);
    if (token) {
      login(token);
    }
    setRestoreLoginAttemptCompleted(true);
  }, []);

  const login = (token) => {
    localStorage.setItem(LOCAL_STORAGE_TOKEN_KEY, token);
    const { sub: username, authorities: authoritiesString } = jwtDecode(token);

    const roles = authoritiesString.split(",");

    const user = {
      username,
      roles,
      token,
      hasRole(role) {
        return this.roles.includes(role);
      }
    }

    console.log(user);

    setCurrentUser(user);

    return user;
  }

  const logout = () => {
    setCurrentUser(null);
    localStorage.removeItem(LOCAL_STORAGE_TOKEN_KEY);
  }

  const auth = {
    currentUser: currentUser ? {...currentUser} : null,
    login,
    logout
  }

  if (!restoreLoginAttemptCompleted) {
    return null;
  }

  return (
    
    <AuthContext.Provider value={auth}>      
       <Router>        
        <NavBar />        
        <Routes>          
          <Route path="/edit/:id" element={currentUser ? <HikeForm 
                        trails={trails}
          /> : <Navigate to="/login" replace={true} />} />          
          <Route path="/add" element={currentUser ? <HikeForm 
                        trails={trails}
          /> : <Navigate to="/login" replace={true} />} />
          <Route path="/delete/:id" element={currentUser ? <HikeForm 
                        trails={trails}
          /> : <Navigate to="/login" replace={true} />} /> 
          {/* <Route path="/add" element={<HikeForm />} />           */}
          <Route path="/confirmation" element={<Confirmation />}/>          
          <Route path="/error" element={<Error />}/>          
          <Route path="/" element={<Home />}/>
          <Route path="/About" element={<About />}/>
          <Route path="/profile" element={<Profile />}/>          
          {/* <Route path="/" element={<HikeFactory />}/> */}
          <Route path="/hikes" element={currentUser ? <CardFactory 
                        hikes={hikes} 
                        setHikes={setHikes} 
                        trails={trails} 
                        hikers={hikers} 
          /> : <Navigate to="/login" replace={true} />} />
          <Route path="/login" element ={!currentUser ? <Login /> : <Navigate to="/" replace={true} />} />     
          <Route path="/register" element={<Register />}/>  
          <Route path="*" element={<NotFound />}/>        
        </Routes>      
      </Router>    
    </AuthContext.Provider>
  );
}

export default App;
