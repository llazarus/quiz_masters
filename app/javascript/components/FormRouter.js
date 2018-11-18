import React from 'react';
import CreateQuizPage from './CreateQuizPage';
import { BrowserRouter, Route, Switch } from 'react-router-dom';

const FormRouter = () => (
    <BrowserRouter>
        <Switch>
            <Route path='/questions/new' component={CreateQuizPage} />
        </Switch>
    </BrowserRouter>
);

export default FormRouter;