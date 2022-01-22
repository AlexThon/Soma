import React, { useState, useEffect } from "react";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import MentorList from "./MentorList";
import Header from "./Header";
import image from "./images/alison.png";
import image2 from "./images/student2.png";
import image3 from "./images/nana.png";
import image4 from "./images/Josh.png";
import Login from "./Login";
import Register from "./Register";
import Profile from "./Profile";
import Mentor from "./Question";
import axios from "axios";

// css
import "./styles/App.scss";

function App() {
  const bgColor = { backgroundColor: "#4979F5" };
  const menuBtnColor = { backgroundColor: "#E8EFFF", color: "#6E7698" };

  const [users, setUsers] = useState([]);
  useEffect(() => {
    axios.get("http://localhost:8080/users").then((res) => {
      console.log(res.data);
      setUsers(res.data);
    });
  }, []);

  return (
    <Router>
      <Header btnColor={menuBtnColor} />
      <section className="App">
        <Routes>
          <Route
            path="/"
            element={<MentorList users={users} buttonColor={bgColor} />}
          />
          <Route path="/login" element={<Login />} />
          <Route path="register" element={<Register />} />
          <Route path="/mentor" element={<Mentor />}>
            <Route path=":id"></Route>
          </Route>

          <Route
            path="/mentors"
            element={<MentorList users={users} buttonColor={bgColor} />}
          >
            <Route path=":id" element={<Mentor />} />
          </Route>
        </Routes>
      </section>
    </Router>
  );
}

export default App;
