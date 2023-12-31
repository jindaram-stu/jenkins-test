import { useState } from 'react';
import './App.css';
import axios from 'axios';

function App() {

  const [message, setMessage] = useState('기본 메시지');

  async function submit() {
    let msg = await axios.get("/api/test")
    console.log(msg)
    setMessage(msg.data);
  }

  return (
    <div className="App">
        <h2>Anyway</h2>
        <h1>!바뀐 리액트</h1>  
        <p>{message}</p>
        <button onClick= {() => {submit()}}>바꾸기</button>
    </div>
  );
}

export default App;