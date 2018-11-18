import React from "react"
import PropTypes from "prop-types"

const AnswerDetails = (props) => (
  
  
  <div className="AnswerDetails">
    <li key={props.id}>
      {props.correct ? "Correct" :
      "Wrong"
      }
      <p>{props.description}</p>
    </li>
  </div>

) 


export default AnswerDetails
