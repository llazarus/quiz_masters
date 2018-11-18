import React from 'react';

const AnswersForm = (props) => {
    const difficulty = Array.from({ length: props.difficulty });
    return (
        <form onSubmit={props.handleAnswersSubmit} id="answersForm">
            {
                difficulty.map((_, ind) => {
                    return (
                        <div className="answer" key={ind}>
                            <label htmlFor="Answer">Answer: </label>
                            <input type="text" name="description" />
                            <input type="checkbox" name="correct" id="correct" /> Correct?
                        </div>
                    )
                })
            }
        </form>
    )
};

export default AnswersForm;

// const { id } = fetch('/questions')
// fetch('/question/answers/id')

// res.send({ quiz })


// { title: 'quiz title', }

// [
//     { id: 5, title: 'question title', description: 'q descrip' },
//     { id: 6, title: 'question title!!!', description: 'q descrip!!' },
// ]

// [{
//     question_id: 5,
//     description: 'answer here',
//     correct: true
// },
// {
//     question_id: 5,
//     description: 'answer here',
//     correct: true
// },
//     {
//         question_id: 6,
//         description: 'answer here',
//         correct: true
//     }]