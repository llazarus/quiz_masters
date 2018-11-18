import React from 'react';
import CreateQuizPage from './CreateQuizPage';
import { BrowserRouter, Route, Switch } from 'react-router-dom';
import CreateQuestion from './CreateQuestion';

const FormRouter = () => (
    <BrowserRouter>
        <Switch>
            <Route path='/quizzes/new' component={CreateQuizPage} />
            <Route path='/quizzes/:quizID/questions/:questionID' component={CreateQuestion} />
        </Switch>
    </BrowserRouter>
);

export default FormRouter;