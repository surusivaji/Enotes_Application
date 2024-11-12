<h1 align="center">📝 eNotes Application</h1>

<p>The <strong>eNotes Application</strong> is a feature-rich note-taking and user management system designed with <strong>Spring MVC</strong>, <strong>Spring Data JPA</strong>, <strong>HTML</strong>, <strong>CSS</strong>, and <strong>JavaScript</strong>. Users can easily manage their notes and account details through this application.</p>

<hr>

<h2 align="center">📌 Key Features</h2>
<ul>
    <li>🔐 <strong>User Registration & Login</strong>: Easy account creation and secure login process.</li>
    <li>🔑 <strong>Password Recovery</strong>: Password reset using mobile and email verification.</li>
    <li>🗒️ <strong>Notes Management</strong>: Add, update, and delete notes to organize information.</li>
    <li>👤 <strong>User Profile Management</strong>: View, update, and delete user profile information.</li>
    <li>💻 <strong>JavaScript Validations</strong>: Ensures data integrity across all forms.</li>
    <li>🔄 <strong>Servlet Chaining</strong>: Improved session control through <code>redirect method</code>.</li>
</ul>

<hr>

<h2 align="center">🏗️ Project Architecture</h2>
<p>The application is organized in a <strong>four-layer architecture</strong> for clean and efficient code management.</p>

<h3>1. Model Layer</h3>
<p>This layer includes entity classes representing database tables:</p>
<ul>
    <li><strong>User Entity</strong>: Contains fields for storing user details.</li>
    <li><strong>Notes Entity</strong>: Stores individual notes with a <strong>Many-to-One relationship</strong> with users.</li>
</ul>

<h3>2. Controller Layer</h3>
<p>Manages <strong>URL mappings</strong>, directs to specific JSP pages, and handles HTTP requests and responses.</p>

<h3>3. Service Layer</h3>
<p>Executes business logic for the application's core functionalities, like managing user and note operations.</p>

<h3>4. Repository Layer</h3>
<p>Includes repository interfaces for interacting with the database to perform CRUD operations on entities.</p>

<hr>

<h2 align="center">🚀 Core Functionalities</h2>
<table align="center">
    <tr>
        <th>Feature</th>
        <th>Description</th>
    </tr>
    <tr>
        <td>🔐 User Registration</td>
        <td>Create a new user account with basic details.</td>
    </tr>
    <tr>
        <td>🔑 User Login</td>
        <td>Login securely to access the application.</td>
    </tr>
    <tr>
        <td>❓ Forgot Password</td>
        <td>Reset password using mobile number and email validation.</td>
    </tr>
    <tr>
        <td>🗒️ Add Notes</td>
        <td>Add new notes for keeping track of tasks or information.</td>
    </tr>
    <tr>
        <td>✏️ Update Notes</td>
        <td>Modify existing notes to keep information up-to-date.</td>
    </tr>
    <tr>
        <td>❌ Delete Notes</td>
        <td>Remove notes that are no longer needed.</td>
    </tr>
    <tr>
        <td>👤 View Profile</td>
        <td>View personal information after logging in.</td>
    </tr>
    <tr>
        <td>✏️ Update Profile</td>
        <td>Update personal information to keep it current.</td>
    </tr>
    <tr>
        <td>🗑️ Delete Account</td>
        <td>Permanently delete the user account if no longer needed.</td>
    </tr>
</table>


<hr>

<h2 align="center">⚙️ Technology Stack</h2>
<ul>
    <li><strong>Backend</strong>: Spring MVC, Spring Data JPA</li>
    <li><strong>Frontend</strong>: HTML, CSS, JavaScript</li>
    <li><strong>Session Management</strong>: Java Session objects to provide dynamic feedback to users</li>
</ul>


<hr>
