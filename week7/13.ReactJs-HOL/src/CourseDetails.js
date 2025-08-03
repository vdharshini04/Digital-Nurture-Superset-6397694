import React from 'react';

function CourseDetails() {
  const courses = ['React', 'Spring Framework', 'PL/SQL'];

  return (
    <div>
      <h3>Course Details</h3>
      <ul>
        {courses.map((course, index) => (
          <li key={index}>{course}</li>
        ))}
      </ul>
    </div>
  );
}

export default CourseDetails;
