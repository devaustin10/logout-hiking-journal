import { useEffect, useState, useContext } from "react";
import { useNavigate, useParams } from "react-router-dom";
import AuthContext from "../Contexts/AuthContext";

import Button from 'react-bootstrap/Button';
import Card from 'react-bootstrap/Card';

function HikeDelete({ messages, setMessages, makeId, parseResponseMessage }) {
    const [hike, setHike] = useState({});
    const { hikeId } = useParams();

    const navigate = useNavigate();

    const auth = useContext(AuthContext);

    useEffect(() => {
        getHike();
    }, []);

    const getHike = () => {
        fetch("http://localhost:8080/api/hike/" + hikeId, {
            headers: {
                Authorization: "Bearer " + auth.currentUser.token
            }
        })
        .then(response => parseResponseMessage(response))
        .then(data => data ? setHike(data) : null)
        .catch(error => {
            // If a user tries to access an hike by an ID that doesn't exist in the database...
            if (error.message === "Unexpected end of JSON input") {
                navigate("/NotFound");
            } else {
                setMessages([...messages, { id: makeId(), type: "failure", text: error.message }]);
            }
        });
    }

    const handleDelete = () => {
        fetch("http://localhost:8080/api/hike/" + hikeId, {   
            method: "DELETE",
            headers: {
                Authorization: "Bearer " + auth.currentUser.token
            }
        })
        .then(response => parseResponseMessage(response, hike, "deleted"))
        .then(() => navigate("/hikes"))
        .catch(error => setMessages([...messages, { id: makeId(), type: "failure", text: error.message }]));
    }

    return (
        <div className="text-center">
            <p className="h4 mb-4">Are you certain you want to delete this entry for {hike?.hikeDate}?</p>
            <Card className="d-inline-block">
                <Card.Body className="text-start">
                    <p className="mb-0"><b>Trail:</b>{hike.trail?.trailName}</p>
                    <p className="mb-0"><b>Hike Difficulty:</b> {hike?.hikeDifficulty}</p>
                    <p className="mb-0"><b>Trail Distance:</b> {hike.trail?.trailDistance} miles</p>
                </Card.Body>
                <Card.Footer>
                    <Button variant={"danger"} onClick={handleDelete}>Confirm</Button>
                    <Button variant={"secondary"} className="ms-2" onClick={() => navigate("/hikes")}>Cancel</Button>
                </Card.Footer>
            </Card>
        </div>
    );
}

export default HikeDelete;