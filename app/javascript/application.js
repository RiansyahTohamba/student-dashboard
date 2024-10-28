// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

document.addEventListener("DOMContentLoaded", function() {
  const studentsData = JSON.parse(document.getElementById('students-data').textContent);
  const bottomStudentsData = JSON.parse(document.getElementById('bottom-students-data').textContent);
  
  const commitData = studentsData.map(student => ({
    y: student.commits,
    x: student.id,
    name: student.name
  }));
  
  const performanceData = studentsData.map(student => ({
    y: student.commits,
    x: student.lines_added,
    name: student.name
  }));


  const studentNames = studentsData.map(student => student.name);
  const linesAddedData = studentsData.map(student => student.lines_added);
  const linesDeletedData = studentsData.map(student => student.lines_deleted);

  // Initialize DataTable for bottom students
  new DataTable('#bottom-students-table', {
      data: bottomStudentsData,
      columns: [
          { data: 'id', title: 'ID' },
          { data: 'name', title: 'Name' },
          { data: 'commits', title: 'Commits' },
          {
            title: 'Actions',
            render: function (data, type, row) {
                return "<a href='/students/"+row.id+"'>Show</a>";
            }
        }
      ],
      order: [[2, 'asc']] // Sort by the third column (commits) in ascending order
  });

  // Scatter plot for number of commits
  new Chart(document.getElementById('commitChart'), {
      type: 'scatter',
      data: {
          datasets: [{
              label: 'Students',
              data: commitData,
              backgroundColor: 'rgba(75, 192, 192, 0.6)'
          }]
      },
      options: {
          scales: {
              y: { title: { display: true, text: 'Commits' } },
              x: { title: { display: true, text: 'Student ID' } }
          },
          plugins: {
              tooltip: {
                  callbacks: {
                      label: function(context) {
                          let label = context.raw.name || '';
                          if (label) {
                              label += ': ';
                          }
                          label += `(${context.parsed.x}, ${context.parsed.y})`;
                          return label;
                      }
                  }
              }
          }
      }
  });

  // Scatter plot for commits vs lines added
  new Chart(document.getElementById('scatterChart'), {
      type: 'scatter',
      data: {
          datasets: [{
              label: 'Students',
              data: performanceData,
              backgroundColor: 'rgba(75, 192, 192, 0.6)'
          }]
      },
      options: {
          scales: {
              x: { title: { display: true, text: 'Lines Added' } },
              y: { title: { display: true, text: 'Commits' } }
          },
          plugins: {
              tooltip: {
                  callbacks: {
                      label: function(context) {
                          let label = context.raw.name || '';
                          if (label) {
                              label += ': ';
                          }
                          label += `(${context.parsed.x}, ${context.parsed.y})`;
                          return label;
                      }
                  }
              }
          }
      }
  });

  // Line chart for code contribution
  new Chart(document.getElementById('lineChart'), {
      type: 'line',
      data: {
          labels: studentNames,
          datasets: [{
              label: 'Lines Added',
              data: linesAddedData,
              borderColor: 'rgba(75, 192, 192, 1)',
              fill: false
          }, {
              label: 'Lines Deleted',
              data: linesDeletedData,
              borderColor: 'rgba(255, 99, 132, 1)',
              fill: false
          }]
      },
      options: {
          scales: {
              y: { beginAtZero: true, title: { display: true, text: 'Lines of Code' } }
          }
      }
  });
});
