# FUNews Management System

A comprehensive News Management System built with ASP.NET Core MVC following 3-Layer architecture, Repository pattern, and Entity Framework Core.

## Features

### Core Functionality
- **News Management**: Create, read, update, and delete news articles
- **Category Management**: Organize news into hierarchical categories
- **Account Management**: User authentication and role-based access control
- **Search Functionality**: Search news articles by title, content, and headline
- **Reporting**: Generate statistics reports for admin users

### User Roles
- **Anonymous Users**: View active news articles
- **Lecturers (Role 2)**: View active news articles
- **Staff (Role 1)**: Manage categories, news articles, and profile
- **Admin (Role 0)**: Manage accounts and generate reports

## Architecture

### 3-Layer Architecture
- **Presentation Layer**: MVC Controllers and Views
- **Business Layer**: Services and Repositories
- **Data Layer**: Entity Framework Models and DbContext

### Design Patterns
- **Repository Pattern**: For data access abstraction
- **Singleton Pattern**: For service management
- **Dependency Injection**: For loose coupling

## Database Design

### Entities
- **SystemAccount**: User accounts with roles
- **NewsArticle**: News articles with content and metadata
- **Category**: Hierarchical categories for news organization
- **Tag**: Tags for news categorization
- **NewsTag**: Many-to-many relationship between news and tags

## Setup Instructions

### Prerequisites
- .NET 10.0 SDK
- SQL Server 2012 or later
- Visual Studio 2019 or later

### Database Setup
1. Create a SQL Server database named `FUNewsManagement`
2. Run the provided `FUNewsManagement.sql` script to create tables and seed initial data

### Application Configuration
1. Update the connection string in `appsettings.json`:
```json
{
  "ConnectionStrings": {
    "DefaultConnection": "Server=YOUR_SERVER;Database=FUNewsManagement;Trusted_Connection=True;MultipleActiveResultSets=true"
  }
}
```

### Running the Application
1. Open the solution in Visual Studio
2. Restore NuGet packages
3. Set `NguyenBinhAnMVC` as the startup project
4. Press F5 or click "Start Debugging"

## Default Accounts

### Admin Account
- **Email**: admin@FUNewsManagementSystem.org
- **Password**: @@abc123@@

## Testing Guide

### Authentication Testing
1. Navigate to the application (defaults to Login page)
2. Test login with default admin credentials
3. Verify role-based navigation menu
4. Test logout functionality

### Admin Functionality Testing
1. **Account Management**:
   - Create new Staff and Lecturer accounts
   - Edit existing account information
   - Delete accounts (with confirmation)
   - Search accounts by name or email

2. **Reports**:
   - Generate news statistics by date range
   - Verify report data accuracy

### Staff Functionality Testing
1. **Category Management**:
   - Create new categories (including sub-categories)
   - Edit category information
   - Delete categories (only if not associated with news)
   - Search categories

2. **News Management**:
   - Create news articles with tags
   - Edit existing articles
   - Delete articles (with confirmation)
   - Search news articles
   - View news history

3. **Profile Management**:
   - Update personal information
   - Change password

### Lecturer Functionality Testing
1. View active news articles
2. Search news articles
3. Filter by category

### Public Access Testing
1. Browse news articles without authentication
2. Search and filter functionality
3. View news details

## Validation Rules

### News Articles
- Title: Required, minimum 5 characters
- Content: Required, minimum 20 characters
- Category: Required selection
- Status: Active/Inactive toggle

### Categories
- Name: Required, minimum 2 characters
- Description: Optional
- Parent Category: Optional (supports hierarchy)

### Accounts
- Name: Required, minimum 3 characters
- Email: Required, valid email format
- Password: Required, minimum 6 characters (for new accounts)
- Role: Required selection

## Security Features

### Authentication
- Session-based authentication
- Role-based access control
- Automatic logout on session timeout

### Authorization
- Controller-level role validation
- Action-level permission checks
- Secure password handling

## Error Handling

### User-Friendly Messages
- Validation error messages
- Confirmation dialogs for destructive actions
- Access denied pages for unauthorized access

### Data Integrity
- Prevent deletion of categories with associated news
- Cascade handling for news-tag relationships
- Transaction management for data consistency

## Performance Considerations

### Database Optimization
- Efficient LINQ queries
- Proper indexing strategies
- Connection pooling

### Caching
- Session management
- Static asset optimization
- Response caching where appropriate

## Deployment Notes

### Production Configuration
1. Update connection strings for production database
2. Configure proper logging levels
3. Set up HTTPS and security headers
4. Configure session timeout appropriately

### Monitoring
- Application logging
- Error tracking
- Performance monitoring

## Troubleshooting

### Common Issues
1. **Database Connection**: Verify connection string and SQL Server accessibility
2. **Authentication**: Check session configuration and cookie settings
3. **Permissions**: Ensure proper role assignments in database
4. **Validation**: Review client-side and server-side validation rules

### Debug Mode
- Enable detailed error messages in development
- Use browser developer tools for client-side issues
- Check Visual Studio output for server-side errors

## Future Enhancements

### Planned Features
- File upload support for news images
- Email notifications for news updates
- Advanced reporting and analytics
- API endpoints for mobile applications
- Multi-language support

### Technical Improvements
- Unit and integration tests
- API documentation
- Performance optimization
- Security hardening
