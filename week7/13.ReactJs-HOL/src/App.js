import React from 'react';
import CourseDetails from './CourseDetails';
import BookDetails from './BookDetails';
import BlogDetails from './BlogDetails';
import './App.css';

function App() {
  return (
    <div className="app-container">
      <div className="column">
        <CourseDetails />
      </div>
      <div className="column middle">
        <BookDetails />
      </div>
      <div className="column">
        <BlogDetails />
      </div>
    </div>
  );
}

export default App;
