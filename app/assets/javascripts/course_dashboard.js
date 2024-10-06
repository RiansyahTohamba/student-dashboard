document.addEventListener('DOMContentLoaded', () => {
    // DataTables initialization
    new DataTable('#bottom-students-table', {
        data: bottom_students,
        columns: [
            { data: 'id', title: 'ID' },
            { data: 'name', title: 'Name' },
            { data: 'commits', title: 'Commits' }
        ],
        order: [[2, 'asc']] // Sort by the third column (commits) in ascending order
    });

    // Charts initialization
    new Chart(document.getElementById('commitChart'), {
        type: 'scatter',
        data: {
            datasets: [{
                label: 'Students',
                data: studentsData,
                backgroundColor: 'rgba(75, 192, 192, 0.6)'
            }]
        },
        options: { /* Your options here */ }
    });

    // Other charts...
});
