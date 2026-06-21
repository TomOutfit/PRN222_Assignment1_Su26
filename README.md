# 📰 FUNews Management System

A state-of-the-art academic community content management portal built on **ASP.NET Core MVC (.NET 10)** following the **3-Layer Architecture** and **Repository Pattern**. Designed for academic campuses to create, categorize, tag, and publish news articles with role-based dashboard controls, advanced visual reports, and multi-format exports.

---

## 🏆 Key Features

### 👥 Role-Based Access Control (RBAC)
The portal supports three distinct authenticated roles in addition to public guest access:

1. **Anonymous / Public Guest**
   * Browse active news articles in chronological order.
   * Search news articles by title, headline, or content keywords.
   * Filter articles by category tree selection.
   * Read full details of news articles.
2. **Lecturer (Role 2)**
   * All public guest capabilities.
   * Profile workspace (customized boards).
3. **Staff (Role 1)**
   * **Dashboard**: Key operational insights.
   * **News Article Management**: Rich CRUD actions on articles, including category selection and tag assignments.
   * **Category Tree Management**: View and construct nested parent-child categories.
   * **Profile Management**: Update personal info and securely change credentials.
4. **Admin (Role 0)**
   * **Dashboard**: Full administrative panel.
   * **Account Control List (ACL)**: Comprehensive CRUD actions on Lecturers and Staff accounts.
   * **Statistical Reporting Engine**: Date-range filtered statistics on article publishing.

---

## 📊 Premium Visualization & Reporting Engine

The Admin statistics panel features an interactive visual reporting dashboard powered by **Chart.js**:

* **4 Analytical Charts**:
  * 🏷️ **Articles by Category**: Category-wise contribution.
  * 🔘 **Status Distribution**: Active vs. Inactive articles.
  * 📈 **Articles Creation Trend**: Timeline trend chart.
  * 👥 **Articles by Author**: Staff publishing velocity.
* **Interactive Chart Type Switcher**: Toggle dynamically between `Bar` vs. `Pie`, `Doughnut` vs. `Pie`, `Line` vs. `Bar`, and `Bar` vs. `Polar` types.
* **Fluid Size Expansion (Grid Toggles)**: Each chart card features a resize button that dynamically expands the layout width from half-width (`col-lg-6`) to full-width (`col-lg-12`) with smooth cubic-bezier transitions, adjusting the canvas height from `400px` to `550px`.
* **Optimized Legends**: Automated legend positioning (placed on the `right` for pie/doughnut layouts) to prevent vertical squeezing on various screen sizes.

### 📥 Multi-Format Exports
* **PDF Export**: Generates a high-quality, landscape A4 PDF of the interactive dashboard charts and data table using `html2pdf.js` (rendered client-side).
* **Excel Export**: Server-side Excel worksheet generation using **EPPlus** with auto-fitted columns, bold green header styling, and metadata attributes.
* **JSON Export**: Dumps raw structured data with indentations for easy API compatibility.

---

## 🏗️ Architecture Design

The system is split into three clean layers to isolate concerns, facilitate testing, and enable loose coupling:

```
[ NguyenBinhAnMVC ] <--- Presentation (Controllers, Views, Session, Styles)
       │
       ▼
[ NguyenBinhAn_A01_Business ] <--- Business Logic (Services, Repository Interfaces)
       │
       ▼
[ NguyenBinhAn_A01_Data ] <--- Data Access (DbContext, EF Models, Repositories)
```

### 1. Presentation Layer (`NguyenBinhAnMVC`)
* **Controllers**: Routes HTTP requests and interacts with BLL Services.
* **Views**: Dynamic Razor pages styled with responsive CSS grid systems, modern gradients, glassmorphism UI cards, and Bootstrap 5.
* **Authentication Filters**: Session-based authorization checking (`UserRole` and `UserEmail`) stored in `HttpContext.Session`.

### 2. Business Logic Layer (`NguyenBinhAn_A01_Business`)
* Contains interfaces and service classes implementing business rules, constraints, and transactions.
* Key Services:
  * `AuthService`: Authentication validation.
  * `CategoryService`: Hierarchy maintenance and deletion guards.
  * `NewsArticleService`: Query filters, tag handling, and history.
  * `SystemAccountService`: Password hashing validation and profile updating.
  * `DashboardService`: Aggregates cross-model statistics for dashboards.

### 3. Data Access Layer (`NguyenBinhAn_A01_Data`)
* **Models**: Entity models mapping to tables: `SystemAccount`, `NewsArticle`, `Category`, `Tag`, `NewsTag`.
* **DbContext**: `FUNewsManagementContext` configuring relationships (e.g., many-to-many tag associations) and constraints.
* **Repositories**: Abstract CRUD operations using Entity Framework Core.

---

## 🗄️ Database Design

The schema models an academic news directory:

* **SystemAccount**: Stores details of users (Admin, Staff, Lecturer).
* **NewsArticle**: News content, status (Active/Inactive), dates, category references, and creator IDs.
* **Category**: Self-referencing parent-child structure (`ParentCategoryID`) to support nesting.
* **Tag**: Tags for articles.
* **NewsTag**: Join table matching `NewsArticle` to `Tag` (many-to-many).

---

## 🛠️ Installation & Setup

### Prerequisites
* **.NET 10.0 SDK** or later
* **SQL Server** (LocalDB or Express edition)
* **Visual Studio 2022** / **VS Code**

### Step 1: Database Setup
1. Create a database in SQL Server called `FUNewsManagement`.
2. Open and execute the database script file (`FUNewsManagement.sql` / `FUNewsManagement_V2.sql` in the workspace root) in your SQL query engine to set up the schema and seed initial data.

### Step 2: Configuration
Update the connection string in `NguyenBinhAnMVC/appsettings.json`:
```json
{
  "ConnectionStrings": {
    "DefaultConnection": "Server=YOUR_SERVER_NAME;Database=FUNewsManagement;Trusted_Connection=True;TrustServerCertificate=True;MultipleActiveResultSets=true"
  }
}
```

### Step 3: Run the Application
From your CLI, navigate to the presentation folder and run the app:
```powershell
cd NguyenBinhAnMVC
dotnet restore
dotnet build
dotnet run
```
Access the application on the local ports (e.g., `http://localhost:5000` or `https://localhost:5001`).

---

## 🔑 Default Credentials

Use these seeded credentials to test respective roles:

| Role | Email | Password | Role Value |
| :--- | :--- | :--- | :--- |
| **Admin** | `admin@FUNewsManagementSystem.org` | `@@abc123@@` | `0` |
| **Staff** | `IsabellaDavid@FUNewsManagement.org` | `@1` | `1` |
| **Lecturer**| `EmmaWilliam@FUNewsManagement.org` | `@1` | `2` |

---

## 🛡️ Key Implementation Safeguards

1. **Delete Protection**:
   * Wrap deletion actions in the Controllers/Services with strict database validation.
   * If a **Category** contains news articles or a **System Account** authored articles, deletion is blocked, returning a clear validation message to the user rather than causing a database exception.
2. **Session Filters**:
   * Protected actions inherit from `BaseController` or contain role checks (`RequireAdminRole`, `RequireStaffRole`) preventing unauthorized cross-route URL requests.
3. **Null-Safety in Reports**:
   * LINQ queries use the null-forgiving operator (`!`) and `GetValueOrDefault()` to prevent `CS8629` compile warnings on nullable database properties.
