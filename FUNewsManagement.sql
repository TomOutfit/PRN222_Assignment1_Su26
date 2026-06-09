USE [master]
GO

-- Drop database if exists
IF EXISTS (SELECT name FROM sys.databases WHERE name = N'FUNewsManagement')
BEGIN
    ALTER DATABASE [FUNewsManagement] SET SINGLE_USER WITH ROLLBACK IMMEDIATE
    DROP DATABASE [FUNewsManagement]
END
GO

CREATE DATABASE [FUNewsManagement]
GO

USE [FUNewsManagement]
GO

-- =====================================================
-- DROP EXISTING TABLES (in reverse dependency order)
-- =====================================================
IF OBJECT_ID('dbo.NewsTag', 'U') IS NOT NULL DROP TABLE [dbo].[NewsTag]
GO
IF OBJECT_ID('dbo.NewsArticle', 'U') IS NOT NULL DROP TABLE [dbo].[NewsArticle]
GO
IF OBJECT_ID('dbo.Category', 'U') IS NOT NULL DROP TABLE [dbo].[Category]
GO
IF OBJECT_ID('dbo.SystemAccount', 'U') IS NOT NULL DROP TABLE [dbo].[SystemAccount]
GO
IF OBJECT_ID('dbo.Tag', 'U') IS NOT NULL DROP TABLE [dbo].[Tag]
GO

-- =====================================================
-- CREATE TABLES
-- =====================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
    [CategoryID] [smallint] IDENTITY(1,1) NOT NULL,
    [CategoryName] [nvarchar](100) NOT NULL,
    [CategoryDesciption] [nvarchar](250) NOT NULL,
    [ParentCategoryID] [smallint] NULL,
    [IsActive] [bit] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
    [CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsArticle](
    [NewsArticleID] [nvarchar](20) NOT NULL,
    [NewsTitle] [nvarchar](400) NULL,
    [Headline] [nvarchar](150) NOT NULL,
    [CreatedDate] [datetime] NULL,
    [NewsContent] [nvarchar](4000) NULL,
    [NewsSource] [nvarchar](400) NULL,
    [CategoryID] [smallint] NULL,
    [NewsStatus] [bit] NULL,
    [CreatedByID] [smallint] NULL,
    [UpdatedByID] [smallint] NULL,
    [ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_NewsArticle] PRIMARY KEY CLUSTERED 
(
    [NewsArticleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsTag](
    [NewsArticleID] [nvarchar](20) NOT NULL,
    [TagID] [int] NOT NULL,
 CONSTRAINT [PK_NewsTag] PRIMARY KEY CLUSTERED 
(
    [NewsArticleID] ASC,
    [TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemAccount](
    [AccountID] [smallint] NOT NULL,
    [AccountName] [nvarchar](100) NULL,
    [AccountEmail] [nvarchar](70) NULL,
    [AccountRole] [int] NULL,
    [AccountPassword] [nvarchar](70) NULL,
 CONSTRAINT [PK_SystemAccount] PRIMARY KEY CLUSTERED 
(
    [AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
    [TagID] [int] NOT NULL,
    [TagName] [nvarchar](50) NULL,
    [Note] [nvarchar](400) NULL,
 CONSTRAINT [PK_HashTag] PRIMARY KEY CLUSTERED 
(
    [TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

-- =====================================================
-- INSERT SYSTEM ACCOUNTS
-- =====================================================

INSERT [dbo].[SystemAccount] ([AccountID], [AccountName], [AccountEmail], [AccountRole], [AccountPassword]) VALUES (1, N'Emma William', N'EmmaWilliam@FUNewsManagement.org', 2, N'@1')
GO
INSERT [dbo].[SystemAccount] ([AccountID], [AccountName], [AccountEmail], [AccountRole], [AccountPassword]) VALUES (2, N'Olivia James', N'OliviaJames@FUNewsManagement.org', 2, N'@1')
GO
INSERT [dbo].[SystemAccount] ([AccountID], [AccountName], [AccountEmail], [AccountRole], [AccountPassword]) VALUES (3, N'Isabella David', N'IsabellaDavid@FUNewsManagement.org', 1, N'@1')
GO
INSERT [dbo].[SystemAccount] ([AccountID], [AccountName], [AccountEmail], [AccountRole], [AccountPassword]) VALUES (4, N'Michael Charlotte', N'MichaelCharlotte@FUNewsManagement.org', 1, N'@1')
GO
INSERT [dbo].[SystemAccount] ([AccountID], [AccountName], [AccountEmail], [AccountRole], [AccountPassword]) VALUES (5, N'Steve Paris', N'SteveParis@FUNewsManagement.org', 1, N'@1')
GO
INSERT [dbo].[SystemAccount] ([AccountID], [AccountName], [AccountEmail], [AccountRole], [AccountPassword]) VALUES (6, N'William Sophia', N'WilliamSophia@FUNewsManagement.org', 1, N'@1')
GO
INSERT [dbo].[SystemAccount] ([AccountID], [AccountName], [AccountEmail], [AccountRole], [AccountPassword]) VALUES (7, N'James Amelia', N'JamesAmelia@FUNewsManagement.org', 1, N'@1')
GO
INSERT [dbo].[SystemAccount] ([AccountID], [AccountName], [AccountEmail], [AccountRole], [AccountPassword]) VALUES (8, N'Benjamin Ava', N'BenjaminAva@FUNewsManagement.org', 1, N'@1')
GO
INSERT [dbo].[SystemAccount] ([AccountID], [AccountName], [AccountEmail], [AccountRole], [AccountPassword]) VALUES (9, N'Ethan Emma', N'EthanEmma@FUNewsManagement.org', 2, N'@1')
GO
INSERT [dbo].[SystemAccount] ([AccountID], [AccountName], [AccountEmail], [AccountRole], [AccountPassword]) VALUES (10, N'Lucas Olivia', N'LucasOlivia@FUNewsManagement.org', 2, N'@1')
GO
INSERT [dbo].[SystemAccount] ([AccountID], [AccountName], [AccountEmail], [AccountRole], [AccountPassword]) VALUES (11, N'Mason Mia', N'MasonMia@FUNewsManagement.org', 2, N'@1')
GO
INSERT [dbo].[SystemAccount] ([AccountID], [AccountName], [AccountEmail], [AccountRole], [AccountPassword]) VALUES (12, N'Alexander Charlotte', N'AlexanderCharlotte@FUNewsManagement.org', 2, N'@1')
GO
INSERT [dbo].[SystemAccount] ([AccountID], [AccountName], [AccountEmail], [AccountRole], [AccountPassword]) VALUES (13, N'Daniel Harper', N'DanielHarper@FUNewsManagement.org', 1, N'@1')
GO
INSERT [dbo].[SystemAccount] ([AccountID], [AccountName], [AccountEmail], [AccountRole], [AccountPassword]) VALUES (14, N'Emily Watson', N'EmilyWatson@FUNewsManagement.org', 2, N'@1')
GO
INSERT [dbo].[SystemAccount] ([AccountID], [AccountName], [AccountEmail], [AccountRole], [AccountPassword]) VALUES (15, N'Henry Clark', N'HenryClark@FUNewsManagement.org', 1, N'@1')
GO
INSERT [dbo].[SystemAccount] ([AccountID], [AccountName], [AccountEmail], [AccountRole], [AccountPassword]) VALUES (16, N'Grace Miller', N'GraceMiller@FUNewsManagement.org', 2, N'@1')
GO
INSERT [dbo].[SystemAccount] ([AccountID], [AccountName], [AccountEmail], [AccountRole], [AccountPassword]) VALUES (17, N'Jack Davis', N'JackDavis@FUNewsManagement.org', 1, N'@1')
GO
INSERT [dbo].[SystemAccount] ([AccountID], [AccountName], [AccountEmail], [AccountRole], [AccountPassword]) VALUES (18, N'Chloe Martinez', N'ChloeMartinez@FUNewsManagement.org', 2, N'@1')
GO
INSERT [dbo].[SystemAccount] ([AccountID], [AccountName], [AccountEmail], [AccountRole], [AccountPassword]) VALUES (19, N'Samuel Wilson', N'SamuelWilson@FUNewsManagement.org', 1, N'@1')
GO
INSERT [dbo].[SystemAccount] ([AccountID], [AccountName], [AccountEmail], [AccountRole], [AccountPassword]) VALUES (20, N'Lily Taylor', N'LilyTaylor@FUNewsManagement.org', 2, N'@1')
GO

-- =====================================================
-- INSERT CATEGORIES
-- =====================================================
SET IDENTITY_INSERT [dbo].[Category] ON
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDesciption], [ParentCategoryID], [IsActive]) VALUES (1, N'Academic news', N'This category can include articles about research findings, faculty appointments and promotions, and other academic-related announcements.', 1, 1)
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDesciption], [ParentCategoryID], [IsActive]) VALUES (2, N'Student Affairs', N'This category can include articles about student activities, events, and initiatives, such as student clubs, organizations and sports.', 2, 1)
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDesciption], [ParentCategoryID], [IsActive]) VALUES (3, N'Campus Safety', N'This category can include articles about incidents and safety measures implemented on campus to ensure the safety of students and faculty.', 3, 1)
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDesciption], [ParentCategoryID], [IsActive]) VALUES (4, N'Alumni News', N'This category can include articles about the achievements and accomplishments of former students and alumni, such as graduations, job promotions and career successes.', 4, 1)
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDesciption], [ParentCategoryID], [IsActive]) VALUES (5, N'Capstone Project News', N'This category is typically a comprehensive and detailed report created as part of an academic or professional capstone project.', 5, 0)
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDesciption], [ParentCategoryID], [IsActive]) VALUES (6, N'Indoor Sports', N'This category covers indoor sports activities such as basketball, volleyball, badminton, table tennis, and gym facilities available on campus.', 2, 1)
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDesciption], [ParentCategoryID], [IsActive]) VALUES (7, N'Outdoor Sports', N'This category covers outdoor sports and recreational activities including soccer, tennis, track and field, and campus outdoor events.', 2, 1)
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDesciption], [ParentCategoryID], [IsActive]) VALUES (8, N'Aquatic Sports', N'This category features articles about swimming, diving, water polo, and other aquatic sports programs and competitions.', 2, 1)
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDesciption], [ParentCategoryID], [IsActive]) VALUES (9, N'Martial Arts & Combat Sports', N'This category covers martial arts programs, wrestling, boxing, fencing, and other combat sports activities on campus.', 2, 1)
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDesciption], [ParentCategoryID], [IsActive]) VALUES (10, N'E-Sports & Gaming', N'This category covers competitive gaming teams, e-sports tournaments, gaming clubs, and related technology events.', 2, 1)
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDesciption], [ParentCategoryID], [IsActive]) VALUES (11, N'Fitness & Wellness Programs', N'This category includes fitness classes, yoga sessions, gym memberships, and wellness programs for students and staff.', 2, 1)
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDesciption], [ParentCategoryID], [IsActive]) VALUES (12, N'Intramural Sports', N'This category covers intramural leagues, recreational sports competitions, and student-organized sports events.', 2, 1)
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDesciption], [ParentCategoryID], [IsActive]) VALUES (13, N'Sports Tournaments & Championships', N'This category features inter-collegiate tournaments, championship events, and major sports competitions.', 2, 1)
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDesciption], [ParentCategoryID], [IsActive]) VALUES (14, N'Sports Facilities & Equipment', N'This category covers updates about sports facilities, gym upgrades, equipment purchases, and new athletic infrastructure.', 3, 1)
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDesciption], [ParentCategoryID], [IsActive]) VALUES (15, N'Athletic Scholarships & Recruitment', N'This category features news about athletic scholarships, recruiting events, and student-athlete recruitment programs.', 28, 1)
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDesciption], [ParentCategoryID], [IsActive]) VALUES (16, N'Sports Medicine & Injury Prevention', N'This category covers sports medicine services, injury prevention programs, and athlete health resources.', 19, 1)
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDesciption], [ParentCategoryID], [IsActive]) VALUES (17, N'Outdoor Adventure & Hiking', N'This category features hiking trips, camping programs, rock climbing, and outdoor adventure activities organized by the university.', 2, 1)
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDesciption], [ParentCategoryID], [IsActive]) VALUES (18, N'Dance & Cheerleading', N'This category covers dance teams, cheerleading squads, and rhythmic sports performances at university events.', 23, 1)
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDesciption], [ParentCategoryID], [IsActive]) VALUES (19, N'Health & Wellness', N'This category includes articles about student health services, mental wellness programs, and campus medical facilities.', 2, 1)
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDesciption], [ParentCategoryID], [IsActive]) VALUES (20, N'Career Services', N'This category covers job postings, career fairs, internship opportunities, and professional development workshops.', 2, 1)
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDesciption], [ParentCategoryID], [IsActive]) VALUES (21, N'International Students', N'This category features news about international student programs, exchange opportunities, and cultural exchange events.', 2, 1)
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDesciption], [ParentCategoryID], [IsActive]) VALUES (22, N'Technology & Innovation', N'This category highlights tech initiatives, digital transformation projects, and innovation labs on campus.', 1, 1)
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDesciption], [ParentCategoryID], [IsActive]) VALUES (23, N'Arts & Culture', N'This category showcases performing arts, visual arts exhibitions, cultural festivals, and creative events.', 2, 1)
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDesciption], [ParentCategoryID], [IsActive]) VALUES (24, N'Research & Grants', N'This category provides updates on funded research projects, grant opportunities, and academic publications.', 1, 1)
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDesciption], [ParentCategoryID], [IsActive]) VALUES (25, N'Community Outreach', N'This category covers university partnerships with local communities, volunteer programs, and social responsibility initiatives.', 1, 1)
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDesciption], [ParentCategoryID], [IsActive]) VALUES (26, N'Facilities & Infrastructure', N'This category includes news about campus building projects, facility upgrades, and infrastructure improvements.', 3, 1)
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDesciption], [ParentCategoryID], [IsActive]) VALUES (27, N'Environment & Sustainability', N'This category covers green initiatives, sustainability programs, and environmental research on campus.', 1, 1)
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDesciption], [ParentCategoryID], [IsActive]) VALUES (28, N'Scholarships & Financial Aid', N'This category features scholarship announcements, financial aid updates, and tuition-related news.', 2, 1)
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDesciption], [ParentCategoryID], [IsActive]) VALUES (29, N'Athletics & Recreation', N'This category covers varsity sports teams, intramural leagues, and campus recreation programs.', 2, 1)
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDesciption], [ParentCategoryID], [IsActive]) VALUES (30, N'Administration & Governance', N'This category includes university policy updates, administrative announcements, and governance decisions.', 1, 0)
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDesciption], [ParentCategoryID], [IsActive]) VALUES (31, N'Community Services', N'Articles and reports about community-driven activities and service learning projects.', 1, 1)
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDesciption], [ParentCategoryID], [IsActive]) VALUES (32, N'Student Union Announcements', N'Updates, elections, policy shifts, and events organized by the Student Union.', 2, 1)
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDesciption], [ParentCategoryID], [IsActive]) VALUES (33, N'Global Partnerships', N'News regarding international academic collaborations, research exchanges, and global university networks.', 1, 1)
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDesciption], [ParentCategoryID], [IsActive]) VALUES (34, N'Student Housing & Dorms', N'Updates about campus dorms, housing policies, residential events, and facilities.', 3, 1)
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryDesciption], [ParentCategoryID], [IsActive]) VALUES (35, N'Alumni Success Stories', N'In-depth profiles of outstanding alumni and their journeys post-graduation.', 4, 1)
GO
SET IDENTITY_INSERT [dbo].[Category] OFF
GO

-- =====================================================
-- INSERT TAGS
-- =====================================================

INSERT [dbo].[Tag] ([TagID], [TagName], [Note]) VALUES (1, N'Education', N'Education Note')
GO
INSERT [dbo].[Tag] ([TagID], [TagName], [Note]) VALUES (2, N'Technology', N'Technology Note')
GO
INSERT [dbo].[Tag] ([TagID], [TagName], [Note]) VALUES (3, N'Research', N'Research Note')
GO
INSERT [dbo].[Tag] ([TagID], [TagName], [Note]) VALUES (4, N'Innovation', N'Innovation Note')
GO
INSERT [dbo].[Tag] ([TagID], [TagName], [Note]) VALUES (5, N'Campus Life', N'Campus Life Note')
GO
INSERT [dbo].[Tag] ([TagID], [TagName], [Note]) VALUES (6, N'Faculty', N'Faculty Achievements')
GO
INSERT [dbo].[Tag] ([TagID], [TagName], [Note]) VALUES (7, N'Alumni', N'Alumni News')
GO
INSERT [dbo].[Tag] ([TagID], [TagName], [Note]) VALUES (8, N'Events', N'University Events')
GO
INSERT [dbo].[Tag] ([TagID], [TagName], [Note]) VALUES (9, N'Resources', N'Campus Resources')
GO
INSERT [dbo].[Tag] ([TagID], [TagName], [Note]) VALUES (10, N'Student Life', N'Student Life Note')
GO
INSERT [dbo].[Tag] ([TagID], [TagName], [Note]) VALUES (11, N'Health', N'Health & Wellness')
GO
INSERT [dbo].[Tag] ([TagID], [TagName], [Note]) VALUES (12, N'Career', N'Career Development')
GO
INSERT [dbo].[Tag] ([TagID], [TagName], [Note]) VALUES (13, N'International', N'International Students')
GO
INSERT [dbo].[Tag] ([TagID], [TagName], [Note]) VALUES (14, N'Tech', N'Technology')
GO
INSERT [dbo].[Tag] ([TagID], [TagName], [Note]) VALUES (15, N'Arts', N'Arts & Culture')
GO
INSERT [dbo].[Tag] ([TagID], [TagName], [Note]) VALUES (16, N'Grants', N'Research Grants')
GO
INSERT [dbo].[Tag] ([TagID], [TagName], [Note]) VALUES (17, N'Community', N'Community Outreach')
GO
INSERT [dbo].[Tag] ([TagID], [TagName], [Note]) VALUES (18, N'Sustainability', N'Environment & Sustainability')
GO
INSERT [dbo].[Tag] ([TagID], [TagName], [Note]) VALUES (19, N'Financial Aid', N'Scholarships & Financial Aid')
GO
INSERT [dbo].[Tag] ([TagID], [TagName], [Note]) VALUES (20, N'Governance', N'Administration & Governance')
GO
INSERT [dbo].[Tag] ([TagID], [TagName], [Note]) VALUES (21, N'Outreach', N'Outreach activities')
GO
INSERT [dbo].[Tag] ([TagID], [TagName], [Note]) VALUES (22, N'Housing', N'Housing and living')
GO
INSERT [dbo].[Tag] ([TagID], [TagName], [Note]) VALUES (23, N'Partnerships', N'University partnerships')
GO
INSERT [dbo].[Tag] ([TagID], [TagName], [Note]) VALUES (24, N'Competitions', N'Academic and athletic competitions')
GO
INSERT [dbo].[Tag] ([TagID], [TagName], [Note]) VALUES (25, N'Scholarships', N'Scholarships and funding')
GO
INSERT [dbo].[Tag] ([TagID], [TagName], [Note]) VALUES (26, N'Wellness', N'Physical and mental health')
GO
INSERT [dbo].[Tag] ([TagID], [TagName], [Note]) VALUES (27, N'Governance Info', N'University policy and governance details')
GO
INSERT [dbo].[Tag] ([TagID], [TagName], [Note]) VALUES (28, N'Alumni Network', N'Alumni relations and networks')
GO
INSERT [dbo].[Tag] ([TagID], [TagName], [Note]) VALUES (29, N'Adventures', N'Outdoor and field trips')
GO
INSERT [dbo].[Tag] ([TagID], [TagName], [Note]) VALUES (30, N'Development', N'Professional and career development')
GO

-- =====================================================
-- INSERT NEWS ARTICLES
-- =====================================================

INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'1', N'University FU Celebrates Success of Alumni in Various Fields', N'University FU Celebrates Success of Alumni in Various Fields', CAST(N'2024-05-05T00:00:00.000' AS DateTime), N'University FU recently commemorated the achievements of its esteemed alumni who have excelled in a multitude of fields, showcasing the impact of the institution''s education on their professional journeys.

Diverse Success Stories: From successful entrepreneurs to renowned artists, University X''s alumni have made significant strides in various industries, reflecting the versatility of the education provided.

Networking Opportunities: The university''s strong alumni network played a crucial role in fostering connections and collaborations among graduates, contributing to their success.

Alumni Contributions: Many alumni have also given back to the university through mentorship programs, scholarships, and guest lectures, enriching the current student experience.', N'N/A', 4, 1, 1, 1, CAST(N'2024-05-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'2', N'Alumni Association Launches Mentorship Program for Recent Graduates', N'Alumni Association Launches Mentorship Program for Recent Graduates', CAST(N'2024-05-05T00:00:00.000' AS DateTime), N'The Alumni Association of University FU recently unveiled a new mentorship program aimed at providing support and guidance to recent graduates as they navigate the transition from academia to the professional world.

The program pairs recent graduates with experienced alumni mentors based on their career interests and goals, ensuring tailored guidance for each mentee.

In addition to one-on-one mentorship, the program offers workshops on resume building, interview preparation, and networking strategies to equip graduates with essential skills for success.

The mentorship program also facilitates networking events where mentees can expand their professional connections and learn from alumni who have excelled in their respective fields.

By fostering a supportive network of alumni mentors, the program aims to empower recent graduates to navigate the challenges of the job market, enhance their professional growth, and build lasting connections within their industries.

The launch of this mentorship program by the Alumni Association of University Y underscores the commitment to nurturing the success of its graduates beyond graduation, creating a strong community of support and guidance for the next generation of professionals.', N'Internet', 4, 1, 1, 1, CAST(N'2024-05-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'3', N'Academic Department Announces Groundbreaking Initiatives and Program Enhancements', N'Academic Department Announces Groundbreaking Initiatives and Program Enhancements', CAST(N'2024-05-05T00:00:00.000' AS DateTime), N'The Software Engineering Department at FU has unveiled a series of transformative initiatives and program enhancements aimed at enriching the academic experience and fostering innovation in Software Development.

The department has established [specific research centers or facilities] dedicated to advancing knowledge and addressing pressing challenges in Software Development.

Faculty Promotions: Several esteemed faculty members have been promoted to key leadership positions, reflecting their commitment to academic excellence and their vision for shaping the future of Software Development.

The academic programs within the department have undergone enhancements to incorporate the latest developments and equip students with practical skills and knowledge relevant to current industry demands.

These initiatives are poised to position the Software Engineering Department as a hub of innovation and academic rigor, attracting top talent and fostering groundbreaking research and learning experiences.', N'N/A', 1, 1, 2, 2, CAST(N'2024-05-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'4', N'Renowned Scholar Appointed as Head of AI Department at FU', N'Renowned Scholar Appointed as Head of AI Department at FU', CAST(N'2024-05-05T00:00:00.000' AS DateTime), N'FU proudly announces the appointment of David Nitzevet, a distinguished scholar in Machine Learning, to the prestigious position of Head of AI Department, underscoring the institution''s commitment to academic excellence and leadership.

David Nitzevet brings a wealth of experience and expertise to the role, with a notable track record of the development of deep learning algorithms and the application of machine learning in healthcare, finance, and marketing. In accepting the appointment, David Nitzevet expressed a vision to develop new algorithmic models, improve data preprocessing techniques, and enhance the interpretability of machine learning models, align with the university''s mission to drive innovation and excellence in Machine Learning.

The appointment is expected to foster collaborations and initiatives that will enrich the academic and research landscape of the university and beyond.

The addition of David Nitzevet to the AI Department faculty elevates the institution''s academic standing and promises to inspire students, scholars, and professionals in Machine Learning. The appointment reaffirms the university''s dedication to recruiting top-tier talent and nurturing an environment where academic distinction thrives.', N'N/A', 1, 1, 2, 2, CAST(N'2024-05-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'5', N'New Research Findings Shed Light on STEM', N'New Research Findings Shed Light on STEM', CAST(N'2024-05-05T00:00:00.000' AS DateTime), N'Groundbreaking research conducted by the Research Department of FU has unveiled significant findings in the field of STEM, offering fresh insights that could revolutionize current understanding and practices.

The success of this research is attributed to the collaborative efforts of a multidisciplinary team, showcasing the institution''s commitment to fostering cutting-edge research. The newly uncovered knowledge has the potential to influence Math, Engineering, Technology and shape future research endeavors, positioning the Research Department of FU as a leader in the advancement of STEM.

The research findings stand as a testament to the institution''s dedication to impactful research and its contribution to the global knowledge base in STEM.', N'N/A', 1, 1, 2, 2, CAST(N'2024-05-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'6', N'New Research Findings Shed Light on STEM', N'New Research Findings Shed Light on STEM', CAST(N'2024-05-05T00:00:00.000' AS DateTime), N'Groundbreaking research conducted by the Research Department of FU has unveiled significant findings in the field of STEM, offering fresh insights that could revolutionize current understanding and practices.

The success of this research is attributed to the collaborative efforts of a multidisciplinary team, showcasing the institution''s commitment to fostering cutting-edge research. The newly uncovered knowledge has the potential to influence Math, Engineering, Technology and shape future research endeavors, positioning the Research Department of FU as a leader in the advancement of STEM.

The research findings stand as a testament to the institution''s dedication to impactful research and its contribution to the global knowledge base in STEM.', N'N/A', 1, 1, 2, 2, CAST(N'2024-05-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'7', N'FU Launches New Mental Health Initiative for Students', N'FU Launches New Mental Health Initiative for Students', CAST(N'2024-05-10T00:00:00.000' AS DateTime), N'University FU has announced a comprehensive mental health initiative designed to support student well-being across all academic levels.

The program includes on-campus counseling services, peer support groups, and stress management workshops available to all enrolled students.

Dedicated mental health professionals will be available for one-on-one sessions, ensuring personalized care for students facing emotional or psychological challenges.

The university has partnered with local healthcare providers to extend support beyond campus boundaries, offering telemedicine options for remote students.

This initiative reflects FU''s commitment to creating a supportive and nurturing academic environment where students can thrive both personally and professionally.', N'FU Health Center', 19, 1, 3, 3, CAST(N'2024-05-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'8', N'Annual Career Fair Draws Record Number of Employers', N'Annual Career Fair Draws Record Number of Employers', CAST(N'2024-05-12T00:00:00.000' AS DateTime), N'The Annual Career Fair at University FU welcomed over 150 employers from diverse industries, making it the largest career event in the university''s history.

Students had the opportunity to explore internship and full-time job opportunities, network with industry professionals, and participate in on-the-spot interviews.

Workshops on resume writing, interview skills, and personal branding were conducted throughout the event, equipping students with essential career readiness tools.

The career fair also featured a dedicated section for graduate school representatives, allowing students to explore advanced degree programs and research opportunities.

Feedback from both employers and students has been overwhelmingly positive, with many attendees reporting valuable connections and potential career pathways.', N'FU Career Services', 20, 1, 4, 4, CAST(N'2024-05-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'9', N'International Student Exchange Program Expands to 10 New Countries', N'International Student Exchange Program Expands to 10 New Countries', CAST(N'2024-05-15T00:00:00.000' AS DateTime), N'University FU has expanded its international student exchange program to include partnerships with universities in 10 new countries, offering students unprecedented global learning opportunities.

The newly added destinations include institutions in South America, Southeast Asia, and Eastern Europe, diversifying the range of cultural experiences available to participating students.

Exchange students will have access to language immersion programs, cross-cultural seminars, and collaborative research projects with host university faculty.

The program aims to develop globally competent graduates by providing them with international academic experience and cross-cultural competencies.

Applications for the upcoming academic year are now open, with scholarship opportunities available for eligible students to support travel and living expenses abroad.', N'FU International Office', 21, 1, 5, 5, CAST(N'2024-05-15T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'10', N'FU Opens State-of-the-Art Innovation Hub for Students and Faculty', N'FU Opens State-of-the-Art Innovation Hub for Students and Faculty', CAST(N'2024-05-18T00:00:00.000' AS DateTime), N'University FU has inaugurated a cutting-edge Innovation Hub equipped with advanced technology resources designed to foster creativity and technological advancement among students and faculty.

The facility features 3D printing labs, virtual reality studios, robotics workshops, and collaborative maker spaces where interdisciplinary teams can develop innovative solutions to real-world challenges.

Faculty members will serve as mentors and advisors, guiding student projects from conceptualization to prototype development and potential commercialization.

The Innovation Hub also hosts regular hackathons, startup competitions, and industry collaboration events to bridge the gap between academic research and practical application.

Funding for the facility was secured through a combination of university investment and partnerships with leading technology companies committed to supporting innovation in education.', N'FU Technology Division', 22, 1, 6, 6, CAST(N'2024-05-18T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'11', N'Annual Arts Festival Celebrates Diversity Through Music, Dance, and Visual Arts', N'Annual Arts Festival Celebrates Diversity Through Music, Dance, and Visual Arts', CAST(N'2024-05-20T00:00:00.000' AS DateTime), N'University FU''s Annual Arts Festival brought together students, faculty, and local artists for a vibrant celebration of cultural diversity through performing and visual arts.

The festival featured live music performances ranging from classical ensembles to contemporary bands, dance showcases representing traditions from around the world, and gallery exhibitions displaying student artwork.

Workshops conducted by professional artists allowed participants to explore various artistic techniques, from painting and sculpture to digital media and interactive installations.

Community outreach components of the festival brought performances to local schools and retirement homes, extending the joy of arts beyond the university campus.

The event underscored the university''s commitment to nurturing creative expression and providing students with opportunities to develop artistic talents alongside their academic pursuits.', N'FU Arts Department', 23, 1, 7, 7, CAST(N'2024-05-20T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'12', N'FU Researchers Secure $5 Million Grant for Climate Change Study', N'FU Researchers Secure $5 Million Grant for Climate Change Study', CAST(N'2024-05-22T00:00:00.000' AS DateTime), N'A team of researchers from University FU has been awarded a prestigious $5 million grant to conduct a comprehensive multi-year study on climate change impacts and adaptation strategies.

The interdisciplinary research team includes experts from environmental science, engineering, economics, and public policy departments, ensuring a holistic approach to the complex challenges posed by climate change.

The study will focus on regional environmental changes, sustainable agriculture practices, and policy frameworks that can help communities adapt to shifting climate conditions.

Collaborations with international research institutions and government agencies will enhance the scope and applicability of the study''s findings and recommendations.

This grant represents the largest single research award in the university''s history, validating FU''s growing reputation as a leader in impactful scientific research.', N'FU Research Office', 24, 1, 8, 8, CAST(N'2024-05-22T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'13', N'University Partners with Local Schools for Community Tutoring Program', N'University Partners with Local Schools for Community Tutoring Program', CAST(N'2024-05-25T00:00:00.000' AS DateTime), N'University FU has launched a community tutoring program in partnership with under-resourced local schools, providing academic support to K-12 students in the surrounding neighborhood.

University students from various academic disciplines serve as volunteer tutors, offering after-school assistance in subjects including mathematics, science, English, and standardized test preparation.

The program not only benefits local schoolchildren by improving their academic performance but also provides FU students with valuable teaching experience and a sense of civic responsibility.

Regular workshops for parents cover topics such as supporting learning at home, navigating the college application process, and accessing educational resources.

The initiative reflects the university''s mission to serve as a positive force in the local community, extending educational resources beyond the confines of the campus.', N'FU Community Relations', 25, 1, 9, 9, CAST(N'2024-05-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'14', N'FU Achieves Zero-Waste Campus Milestone with New Sustainability Initiative', N'FU Achieves Zero-Waste Campus Milestone with New Sustainability Initiative', CAST(N'2024-05-28T00:00:00.000' AS DateTime), N'University FU has announced the achievement of a landmark zero-waste milestone, diverting over 90% of campus waste from landfills through an ambitious sustainability program.

Key components of the initiative include comprehensive recycling and composting infrastructure, a campus-wide single-use plastic ban, and a robust food waste reduction campaign in dining facilities.

Student-led advocacy groups played a pivotal role in driving behavioral change, organizing awareness campaigns and peer education programs that empowered the campus community to adopt more sustainable habits.

The university has also invested in renewable energy sources, with solar panel installations now powering several major campus buildings and reducing the institution''s carbon footprint significantly.

The zero-waste achievement positions FU as a leader in environmental stewardship among higher education institutions, inspiring similar initiatives at peer universities.', N'FU Sustainability Office', 27, 1, 10, 10, CAST(N'2024-05-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'15', N'New Scholarship Program to Support First-Generation College Students', N'New Scholarship Program to Support First-Generation College Students', CAST(N'2024-06-01T00:00:00.000' AS DateTime), N'University FU has established a new scholarship program specifically designed to support first-generation college students, removing financial barriers to higher education access.

The program provides full tuition coverage, book stipends, and housing assistance to eligible recipients, ensuring that financial constraints do not impede academic success.

In addition to financial support, scholarship recipients will have access to a dedicated mentorship network connecting them with faculty advisors and successful first-generation alumni.

Academic support services including tutoring, study groups, and writing workshops will be provided to help scholars navigate the unique challenges they may encounter in higher education.

The scholarship program reflects the university''s commitment to diversity, equity, and inclusion, fostering an academic community where students from all backgrounds can thrive and achieve their full potential.', N'FU Financial Aid Office', 28, 1, 11, 11, CAST(N'2024-06-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'16', N'FU Varsity Basketball Team Advances to National Championship', N'FU Varsity Basketball Team Advances to National Championship', CAST(N'2024-06-03T00:00:00.000' AS DateTime), N'The FU varsity basketball team has earned a spot in the National Collegiate Athletic Association championship after an outstanding season marked by determination, teamwork, and athletic excellence.

The team overcame strong opponents in the regional playoffs, culminating in a thrilling overtime victory that secured their place among the nation''s top collegiate teams.

Head coach highlighted the players'' dedication both on and off the court, noting their commitment to maintaining academic standards while pursuing athletic goals.

The university community has rallied behind the team, with student fans organizing spirit events and alumni offering support through the official booster program.

The championship run has brought significant national visibility to University FU, boosting applicant interest and strengthening the institution''s reputation for athletic and academic distinction.', N'FU Athletics Department', 29, 1, 12, 12, CAST(N'2024-06-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'17', N'Campus Safety Department Introduces 24/7 Emergency Response System', N'Campus Safety Department Introduces 24/7 Emergency Response System', CAST(N'2024-06-05T00:00:00.000' AS DateTime), N'The Campus Safety Department at University FU has launched a comprehensive 24/7 emergency response system designed to enhance the safety and security of all campus community members.

The system includes an updated mobile safety app with real-time location sharing, emergency alerts, and direct connectivity to campus safety officers stationed across all campus zones.

Blue light emergency towers have been installed throughout the campus, ensuring that students, faculty, and staff can quickly summon help in any situation.

Safety officers have undergone specialized training in conflict de-escalation, first aid, and crisis response, ensuring a professional and compassionate approach to emergency situations.

The initiative was developed in consultation with students and safety experts, reflecting the university''s proactive approach to creating a secure learning environment.', N'FU Campus Safety', 3, 1, 3, 3, CAST(N'2024-06-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'18', N'New Library Wing Opens with Advanced Research Resources', N'New Library Wing Opens with Advanced Research Resources', CAST(N'2024-06-08T00:00:00.000' AS DateTime), N'University FU has opened a new wing of its central library, expanding study and research spaces while introducing cutting-edge digital resources and collaborative workspaces for students and faculty.

The 50,000-square-foot addition features individual study carrels, group discussion rooms equipped with smart technology, and a dedicated graduate research commons.

A state-of-the-art digital archive has been established to preserve rare manuscripts, historical documents, and multimedia collections accessible to the university community and approved external researchers.

The new wing was designed with sustainability in mind, incorporating natural lighting, energy-efficient systems, and LEED-certified building materials.

Grand opening celebrations included author readings, research showcase exhibitions, and library orientation tours highlighting the new resources available to support academic excellence.', N'FU Library Services', 1, 1, 4, 4, CAST(N'2024-06-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'19', N'Campus Dining Services Goes Fully Organic and Locally Sourced', N'Campus Dining Services Goes Fully Organic and Locally Sourced', CAST(N'2024-06-10T00:00:00.000' AS DateTime), N'University FU''s dining services has completed a transition to a fully organic and locally sourced food model, setting a new standard for sustainable campus dining across the region.

All produce, dairy, and protein products served in campus dining halls now come from certified organic farms within a 100-mile radius of the university, supporting local agriculture and reducing transportation-related carbon emissions.

A new menu rotation featuring seasonal ingredients has been developed in collaboration with nutritionists and professional chefs, ensuring that students enjoy flavorful, healthy, and environmentally responsible meals.

Student interns from the agricultural science and culinary arts programs gain hands-on experience through partnerships with local farms, bridging academic learning with practical food system knowledge.

The initiative aligns with the university''s broader sustainability goals and has received enthusiastic support from students who appreciate the improved quality and transparency of campus food offerings.', N'FU Dining Services', 2, 1, 5, 5, CAST(N'2024-06-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'20', N'AI Research Lab Publishes Breakthrough in Natural Language Processing', N'AI Research Lab Publishes Breakthrough in Natural Language Processing', CAST(N'2024-06-12T00:00:00.000' AS DateTime), N'Researchers at the FU Artificial Intelligence Laboratory have published a groundbreaking paper on natural language processing that has garnered international attention from both academia and industry.

The research introduces a novel architecture for language models that significantly improves contextual understanding while reducing computational resource requirements by over 40 percent.

Collaborative efforts between computer scientists, linguists, and cognitive psychologists informed the interdisciplinary approach that made this breakthrough possible.

The team has released an open-source implementation of the model, enabling researchers worldwide to build upon and apply the findings to diverse language processing challenges.

Funding for the research was provided by a combination of government research grants and industry partnerships, demonstrating the value of academic-industry collaboration in advancing frontier technologies.', N'FU AI Research Lab', 22, 1, 6, 6, CAST(N'2024-06-12T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'21', N'The Campus Athletics Committee celebrated the milestone achievement of sustainable urban architecture', N'Academic news: The Campus Athletics Committee celebrated the milestone achievement of sustainable urban architectur', CAST(N'2025-05-17T16:01:00.000' AS DateTime), N'The Campus Athletics Committee celebrated the milestone achievement of sustainable urban architecture.

In a major update from University FU, the campus athletics committee has officially celebrated the milestone achievement of sustainable urban architecture. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

This project is expected to revolutionize how students interact with modern tools and methodologies.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. The university has committed additional funding to expand this program into subsequent academic semesters.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Preliminary results demonstrate an impressive improvement in key performance metrics across the board.', N'Research Center Desk', 1, 0, 13, 13, CAST(N'2025-05-18T19:01:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'22', N'The Business School Faculty partnered with local industries for local community educational tutoring', N'Student Affairs: The Business School Faculty partnered with local industries for local community educational tutoring', CAST(N'2025-11-16T15:32:00.000' AS DateTime), N'The Business School Faculty partnered with local industries for local community educational tutoring.

In a major update from University FU, the business school faculty has officially partnered with local industries for local community educational tutoring. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Several regional publications have highlighted this effort as a model for other higher education networks.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.', N'Athletics Office', 2, 1, 5, 5, CAST(N'2025-11-18T23:32:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'23', N'The Global Partnerships Board celebrated the milestone achievement of campus emergency response coordination', N'Campus Safety: The Global Partnerships Board celebrated the milestone achievement of campus emergency response coor', CAST(N'2024-07-14T08:32:00.000' AS DateTime), N'The Global Partnerships Board celebrated the milestone achievement of campus emergency response coordination.

In a major update from University FU, the global partnerships board has officially celebrated the milestone achievement of campus emergency response coordination. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Preliminary results demonstrate an impressive improvement in key performance metrics across the board.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.', N'Community Outreach Desk', 3, 1, 15, 11, CAST(N'2024-07-16T09:32:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'24', N'The Library Services Committee introduced a revised curriculum focusing on cutting-edge technological advancements', N'Alumni News: The Library Services Committee introduced a revised curriculum focusing on cutting-edge technologica', CAST(N'2025-06-20T12:42:00.000' AS DateTime), N'The Library Services Committee introduced a revised curriculum focusing on cutting-edge technological advancements.

In a major update from University FU, the library services committee has officially introduced a revised curriculum focusing on cutting-edge technological advancements. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. The university has committed additional funding to expand this program into subsequent academic semesters.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. This project is expected to revolutionize how students interact with modern tools and methodologies.', N'Research Center Desk', 4, 0, 9, 9, CAST(N'2025-06-23T17:42:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'25', N'The Varsity Esports Club organized a university-wide forum regarding next-generation renewable energy grids', N'Capstone Project News: The Varsity Esports Club organized a university-wide forum regarding next-generation renewable energ', CAST(N'2024-07-29T14:05:00.000' AS DateTime), N'The Varsity Esports Club organized a university-wide forum regarding next-generation renewable energy grids.

In a major update from University FU, the varsity esports club has officially organized a university-wide forum regarding next-generation renewable energy grids. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Preliminary results demonstrate an impressive improvement in key performance metrics across the board.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. The university has committed additional funding to expand this program into subsequent academic semesters.', N'Community Outreach Desk', 5, 1, 5, 17, CAST(N'2024-07-29T22:05:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'26', N'The Student Affairs Association celebrated the milestone achievement of sustainable urban architecture', N'Indoor Sports: The Student Affairs Association celebrated the milestone achievement of sustainable urban architectu', CAST(N'2026-03-08T09:00:00.000' AS DateTime), N'The Student Affairs Association celebrated the milestone achievement of sustainable urban architecture.

In a major update from University FU, the student affairs association has officially celebrated the milestone achievement of sustainable urban architecture. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Several regional publications have highlighted this effort as a model for other higher education networks.', N'Student Union', 6, 1, 1, 1, CAST(N'2026-03-08T18:00:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'27', N'The Capstone Project Council introduced a revised curriculum focusing on cross-cultural student exchanges', N'Outdoor Sports: The Capstone Project Council introduced a revised curriculum focusing on cross-cultural student exch', CAST(N'2024-07-15T16:30:00.000' AS DateTime), N'The Capstone Project Council introduced a revised curriculum focusing on cross-cultural student exchanges.

In a major update from University FU, the capstone project council has officially introduced a revised curriculum focusing on cross-cultural student exchanges. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Several regional publications have highlighted this effort as a model for other higher education networks.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. This project is expected to revolutionize how students interact with modern tools and methodologies.', N'Community Outreach Desk', 7, 1, 4, 13, CAST(N'2024-07-16T21:30:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'28', N'The Department of Software Engineering published groundbreaking findings on cutting-edge technological advancements', N'Aquatic Sports: The Department of Software Engineering published groundbreaking findings on cutting-edge technologic', CAST(N'2026-05-28T11:19:00.000' AS DateTime), N'The Department of Software Engineering published groundbreaking findings on cutting-edge technological advancements.

In a major update from University FU, the department of software engineering has officially published groundbreaking findings on cutting-edge technological advancements. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Several regional publications have highlighted this effort as a model for other higher education networks.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Preliminary results demonstrate an impressive improvement in key performance metrics across the board.', N'Tech Division', 8, 1, 9, 9, CAST(N'2026-06-02T12:19:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'29', N'The Health and Wellness Center launched a new initiative targeting sustainable urban architecture', N'Martial Arts & Combat Sports: The Health and Wellness Center launched a new initiative targeting sustainable urban architecture', CAST(N'2025-03-16T09:39:00.000' AS DateTime), N'The Health and Wellness Center launched a new initiative targeting sustainable urban architecture.

In a major update from University FU, the health and wellness center has officially launched a new initiative targeting sustainable urban architecture. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

The university has committed additional funding to expand this program into subsequent academic semesters.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Several regional publications have highlighted this effort as a model for other higher education networks.', N'Athletics Office', 9, 1, 13, 16, CAST(N'2025-03-21T15:39:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'30', N'The Performing Arts Ensemble launched a new initiative targeting campus emergency response coordination', N'E-Sports & Gaming: The Performing Arts Ensemble launched a new initiative targeting campus emergency response coordinat', CAST(N'2026-05-16T14:05:00.000' AS DateTime), N'The Performing Arts Ensemble launched a new initiative targeting campus emergency response coordination.

In a major update from University FU, the performing arts ensemble has officially launched a new initiative targeting campus emergency response coordination. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Several regional publications have highlighted this effort as a model for other higher education networks.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. The university has committed additional funding to expand this program into subsequent academic semesters.', N'Research Center Desk', 10, 1, 17, 17, CAST(N'2026-05-17T00:05:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'31', N'The Capstone Project Council introduced a revised curriculum focusing on next-generation renewable energy grids', N'Fitness & Wellness Programs: The Capstone Project Council introduced a revised curriculum focusing on next-generation renewable e', CAST(N'2024-07-25T12:35:00.000' AS DateTime), N'The Capstone Project Council introduced a revised curriculum focusing on next-generation renewable energy grids.

In a major update from University FU, the capstone project council has officially introduced a revised curriculum focusing on next-generation renewable energy grids. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. The university has committed additional funding to expand this program into subsequent academic semesters.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Several regional publications have highlighted this effort as a model for other higher education networks.', N'Community Outreach Desk', 11, 1, 5, 7, CAST(N'2024-07-27T17:35:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'32', N'The Environmental Science Group celebrated the milestone achievement of innovative agricultural ecosystems', N'Intramural Sports: The Environmental Science Group celebrated the milestone achievement of innovative agricultural ecos', CAST(N'2026-02-06T10:45:00.000' AS DateTime), N'The Environmental Science Group celebrated the milestone achievement of innovative agricultural ecosystems.

In a major update from University FU, the environmental science group has officially celebrated the milestone achievement of innovative agricultural ecosystems. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.', N'Research Center Desk', 12, 1, 1, 1, CAST(N'2026-02-09T19:45:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'33', N'The Student Affairs Association introduced a revised curriculum focusing on financial aid accessibility policies', N'Sports Tournaments & Championships: The Student Affairs Association introduced a revised curriculum focusing on financial aid accessibil', CAST(N'2024-12-22T09:31:00.000' AS DateTime), N'The Student Affairs Association introduced a revised curriculum focusing on financial aid accessibility policies.

In a major update from University FU, the student affairs association has officially introduced a revised curriculum focusing on financial aid accessibility policies. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Several regional publications have highlighted this effort as a model for other higher education networks.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.', N'International Office News', 13, 1, 18, 18, CAST(N'2024-12-25T12:31:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'34', N'The Alumni Relations Network established a strategic alliance with cross-cultural student exchanges', N'Sports Facilities & Equipment: The Alumni Relations Network established a strategic alliance with cross-cultural student exchanges', CAST(N'2026-05-18T16:52:00.000' AS DateTime), N'The Alumni Relations Network established a strategic alliance with cross-cultural student exchanges.

In a major update from University FU, the alumni relations network has officially established a strategic alliance with cross-cultural student exchanges. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

The university has committed additional funding to expand this program into subsequent academic semesters.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Preliminary results demonstrate an impressive improvement in key performance metrics across the board.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.', N'Tech Division', 14, 0, 5, 14, CAST(N'2026-05-19T01:52:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'35', N'The Campus Security Taskforce partnered with local industries for sustainable urban architecture', N'Athletic Scholarships & Recruitment: The Campus Security Taskforce partnered with local industries for sustainable urban architecture', CAST(N'2026-01-31T18:25:00.000' AS DateTime), N'The Campus Security Taskforce partnered with local industries for sustainable urban architecture.

In a major update from University FU, the campus security taskforce has officially partnered with local industries for sustainable urban architecture. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

This project is expected to revolutionize how students interact with modern tools and methodologies.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Several regional publications have highlighted this effort as a model for other higher education networks.', N'Community Outreach Desk', 15, 1, 7, 11, CAST(N'2026-02-01T19:25:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'36', N'The Alumni Relations Network established a strategic alliance with sustainable urban architecture', N'Sports Medicine & Injury Prevention: The Alumni Relations Network established a strategic alliance with sustainable urban architecture', CAST(N'2026-01-28T18:49:00.000' AS DateTime), N'The Alumni Relations Network established a strategic alliance with sustainable urban architecture.

In a major update from University FU, the alumni relations network has officially established a strategic alliance with sustainable urban architecture. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Several regional publications have highlighted this effort as a model for other higher education networks.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. This project is expected to revolutionize how students interact with modern tools and methodologies.', N'FU Communications', 16, 0, 19, 10, CAST(N'2026-02-03T00:49:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'37', N'The Health and Wellness Center unveiled plans to enhance sustainable urban architecture', N'Outdoor Adventure & Hiking: The Health and Wellness Center unveiled plans to enhance sustainable urban architecture', CAST(N'2024-08-13T18:27:00.000' AS DateTime), N'The Health and Wellness Center unveiled plans to enhance sustainable urban architecture.

In a major update from University FU, the health and wellness center has officially unveiled plans to enhance sustainable urban architecture. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. The university has committed additional funding to expand this program into subsequent academic semesters.', N'International Office News', 17, 1, 5, 5, CAST(N'2024-08-18T22:27:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'38', N'The Student Affairs Association established a strategic alliance with interdisciplinary capstone engineering solutions', N'Dance & Cheerleading: The Student Affairs Association established a strategic alliance with interdisciplinary capstone eng', CAST(N'2025-01-20T17:29:00.000' AS DateTime), N'The Student Affairs Association established a strategic alliance with interdisciplinary capstone engineering solutions.

In a major update from University FU, the student affairs association has officially established a strategic alliance with interdisciplinary capstone engineering solutions. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

This project is expected to revolutionize how students interact with modern tools and methodologies.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Preliminary results demonstrate an impressive improvement in key performance metrics across the board.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.', N'FU Communications', 18, 1, 10, 7, CAST(N'2025-01-22T21:29:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'39', N'The Career Development Center upgraded its facilities for sports medicine and injury prevention', N'Health & Wellness: The Career Development Center upgraded its facilities for sports medicine and injury prevention', CAST(N'2026-01-23T11:56:00.000' AS DateTime), N'The Career Development Center upgraded its facilities for sports medicine and injury prevention.

In a major update from University FU, the career development center has officially upgraded its facilities for sports medicine and injury prevention. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Preliminary results demonstrate an impressive improvement in key performance metrics across the board.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.', N'International Office News', 19, 1, 11, 11, CAST(N'2026-01-26T14:56:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'40', N'The Innovation and Incubation Lab published groundbreaking findings on interdisciplinary capstone engineering solutions', N'Career Services: The Innovation and Incubation Lab published groundbreaking findings on interdisciplinary capstone en', CAST(N'2025-06-17T14:13:00.000' AS DateTime), N'The Innovation and Incubation Lab published groundbreaking findings on interdisciplinary capstone engineering solutions.

In a major update from University FU, the innovation and incubation lab has officially published groundbreaking findings on interdisciplinary capstone engineering solutions. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Several regional publications have highlighted this effort as a model for other higher education networks.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. The university has committed additional funding to expand this program into subsequent academic semesters.', N'Tech Division', 20, 1, 5, 18, CAST(N'2025-06-17T17:13:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'41', N'The Library Services Committee partnered with local industries for creative visual arts exhibitions', N'International Students: The Library Services Committee partnered with local industries for creative visual arts exhibitions', CAST(N'2025-08-13T16:40:00.000' AS DateTime), N'The Library Services Committee partnered with local industries for creative visual arts exhibitions.

In a major update from University FU, the library services committee has officially partnered with local industries for creative visual arts exhibitions. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

This project is expected to revolutionize how students interact with modern tools and methodologies.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Preliminary results demonstrate an impressive improvement in key performance metrics across the board.', N'Community Outreach Desk', 21, 1, 16, 13, CAST(N'2025-08-17T17:40:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'42', N'The Business School Faculty published groundbreaking findings on innovative agricultural ecosystems', N'Technology & Innovation: The Business School Faculty published groundbreaking findings on innovative agricultural ecosystems', CAST(N'2026-02-06T09:40:00.000' AS DateTime), N'The Business School Faculty published groundbreaking findings on innovative agricultural ecosystems.

In a major update from University FU, the business school faculty has officially published groundbreaking findings on innovative agricultural ecosystems. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Preliminary results demonstrate an impressive improvement in key performance metrics across the board.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.', N'Student Union', 22, 1, 5, 9, CAST(N'2026-02-11T19:40:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'43', N'The Global Partnerships Board secured funding for projects related to student mental health advocacy', N'Arts & Culture: The Global Partnerships Board secured funding for projects related to student mental health advocacy', CAST(N'2026-03-09T18:09:00.000' AS DateTime), N'The Global Partnerships Board secured funding for projects related to student mental health advocacy.

In a major update from University FU, the global partnerships board has officially secured funding for projects related to student mental health advocacy. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.', N'Tech Division', 23, 1, 19, 19, CAST(N'2026-03-12T23:09:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'44', N'The Campus Athletics Committee published groundbreaking findings on quantum computing research frontiers', N'Research & Grants: The Campus Athletics Committee published groundbreaking findings on quantum computing research front', CAST(N'2024-12-14T15:25:00.000' AS DateTime), N'The Campus Athletics Committee published groundbreaking findings on quantum computing research frontiers.

In a major update from University FU, the campus athletics committee has officially published groundbreaking findings on quantum computing research frontiers. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Preliminary results demonstrate an impressive improvement in key performance metrics across the board.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. This project is expected to revolutionize how students interact with modern tools and methodologies.', N'Community Outreach Desk', 24, 1, 19, 19, CAST(N'2024-12-19T22:25:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'45', N'The Varsity Esports Club upgraded its facilities for high-performance athletic conditioning', N'Community Outreach: The Varsity Esports Club upgraded its facilities for high-performance athletic conditioning', CAST(N'2025-01-14T11:02:00.000' AS DateTime), N'The Varsity Esports Club upgraded its facilities for high-performance athletic conditioning.

In a major update from University FU, the varsity esports club has officially upgraded its facilities for high-performance athletic conditioning. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. The university has committed additional funding to expand this program into subsequent academic semesters.', N'Athletics Office', 25, 1, 15, 10, CAST(N'2025-01-15T12:02:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'46', N'The Campus Security Taskforce introduced a revised curriculum focusing on quantum computing research frontiers', N'Facilities & Infrastructure: The Campus Security Taskforce introduced a revised curriculum focusing on quantum computing research', CAST(N'2026-01-18T11:43:00.000' AS DateTime), N'The Campus Security Taskforce introduced a revised curriculum focusing on quantum computing research frontiers.

In a major update from University FU, the campus security taskforce has officially introduced a revised curriculum focusing on quantum computing research frontiers. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. This project is expected to revolutionize how students interact with modern tools and methodologies.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.', N'Student Union', 26, 1, 13, 4, CAST(N'2026-01-21T19:43:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'47', N'The Department of Software Engineering partnered with local industries for modern cyber-security defense frameworks', N'Environment & Sustainability: The Department of Software Engineering partnered with local industries for modern cyber-security def', CAST(N'2024-10-13T10:39:00.000' AS DateTime), N'The Department of Software Engineering partnered with local industries for modern cyber-security defense frameworks.

In a major update from University FU, the department of software engineering has officially partnered with local industries for modern cyber-security defense frameworks. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

This project is expected to revolutionize how students interact with modern tools and methodologies.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.', N'Athletics Office', 27, 1, 17, 17, CAST(N'2024-10-18T16:39:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'48', N'The Campus Security Taskforce partnered with local industries for cross-cultural student exchanges', N'Scholarships & Financial Aid: The Campus Security Taskforce partnered with local industries for cross-cultural student exchanges', CAST(N'2025-04-19T17:02:00.000' AS DateTime), N'The Campus Security Taskforce partnered with local industries for cross-cultural student exchanges.

In a major update from University FU, the campus security taskforce has officially partnered with local industries for cross-cultural student exchanges. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. This project is expected to revolutionize how students interact with modern tools and methodologies.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.', N'Athletics Office', 28, 1, 1, 1, CAST(N'2025-04-24T20:02:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'49', N'The Global Partnerships Board partnered with local industries for local community educational tutoring', N'Athletics & Recreation: The Global Partnerships Board partnered with local industries for local community educational tutori', CAST(N'2025-01-25T08:32:00.000' AS DateTime), N'The Global Partnerships Board partnered with local industries for local community educational tutoring.

In a major update from University FU, the global partnerships board has officially partnered with local industries for local community educational tutoring. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Preliminary results demonstrate an impressive improvement in key performance metrics across the board.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. This project is expected to revolutionize how students interact with modern tools and methodologies.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. The university has committed additional funding to expand this program into subsequent academic semesters.', N'FU Communications', 29, 1, 9, 6, CAST(N'2025-01-26T12:32:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'50', N'The Department of Software Engineering unveiled plans to enhance local community educational tutoring', N'Administration & Governance: The Department of Software Engineering unveiled plans to enhance local community educational tutorin', CAST(N'2025-08-19T14:44:00.000' AS DateTime), N'The Department of Software Engineering unveiled plans to enhance local community educational tutoring.

In a major update from University FU, the department of software engineering has officially unveiled plans to enhance local community educational tutoring. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Several regional publications have highlighted this effort as a model for other higher education networks.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. This project is expected to revolutionize how students interact with modern tools and methodologies.', N'International Office News', 30, 1, 13, 13, CAST(N'2025-08-23T17:44:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'51', N'The Student Affairs Association established a strategic alliance with financial aid accessibility policies', N'Community Services: The Student Affairs Association established a strategic alliance with financial aid accessibility po', CAST(N'2026-05-02T12:22:00.000' AS DateTime), N'The Student Affairs Association established a strategic alliance with financial aid accessibility policies.

In a major update from University FU, the student affairs association has officially established a strategic alliance with financial aid accessibility policies. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Preliminary results demonstrate an impressive improvement in key performance metrics across the board.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.', N'Student Union', 31, 1, 7, 20, CAST(N'2026-05-07T14:22:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'52', N'The Department of Software Engineering partnered with local industries for student mental health advocacy', N'Student Union Announcements: The Department of Software Engineering partnered with local industries for student mental health adv', CAST(N'2025-12-10T12:10:00.000' AS DateTime), N'The Department of Software Engineering partnered with local industries for student mental health advocacy.

In a major update from University FU, the department of software engineering has officially partnered with local industries for student mental health advocacy. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

The university has committed additional funding to expand this program into subsequent academic semesters.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.', N'FU Communications', 32, 1, 20, 20, CAST(N'2025-12-14T13:10:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'53', N'The Environmental Science Group secured funding for projects related to sports medicine and injury prevention', N'Global Partnerships: The Environmental Science Group secured funding for projects related to sports medicine and injury p', CAST(N'2025-05-06T17:22:00.000' AS DateTime), N'The Environmental Science Group secured funding for projects related to sports medicine and injury prevention.

In a major update from University FU, the environmental science group has officially secured funding for projects related to sports medicine and injury prevention. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Several regional publications have highlighted this effort as a model for other higher education networks.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. This project is expected to revolutionize how students interact with modern tools and methodologies.', N'Research Center Desk', 33, 1, 8, 8, CAST(N'2025-05-11T23:22:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'54', N'The Innovation and Incubation Lab hosted an international symposium on cross-cultural student exchanges', N'Student Housing & Dorms: The Innovation and Incubation Lab hosted an international symposium on cross-cultural student exchan', CAST(N'2025-12-08T13:02:00.000' AS DateTime), N'The Innovation and Incubation Lab hosted an international symposium on cross-cultural student exchanges.

In a major update from University FU, the innovation and incubation lab has officially hosted an international symposium on cross-cultural student exchanges. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Several regional publications have highlighted this effort as a model for other higher education networks.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.', N'Community Outreach Desk', 34, 1, 15, 14, CAST(N'2025-12-08T23:02:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'55', N'The Career Development Center unveiled plans to enhance interdisciplinary capstone engineering solutions', N'Alumni Success Stories: The Career Development Center unveiled plans to enhance interdisciplinary capstone engineering solut', CAST(N'2025-05-08T09:17:00.000' AS DateTime), N'The Career Development Center unveiled plans to enhance interdisciplinary capstone engineering solutions.

In a major update from University FU, the career development center has officially unveiled plans to enhance interdisciplinary capstone engineering solutions. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Several regional publications have highlighted this effort as a model for other higher education networks.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Preliminary results demonstrate an impressive improvement in key performance metrics across the board.', N'Research Center Desk', 35, 1, 9, 6, CAST(N'2025-05-08T17:17:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'56', N'The Career Development Center hosted an international symposium on advanced deep learning algorithms', N'Academic news: The Career Development Center hosted an international symposium on advanced deep learning algorithms', CAST(N'2025-08-12T17:20:00.000' AS DateTime), N'The Career Development Center hosted an international symposium on advanced deep learning algorithms.

In a major update from University FU, the career development center has officially hosted an international symposium on advanced deep learning algorithms. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Preliminary results demonstrate an impressive improvement in key performance metrics across the board.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Several regional publications have highlighted this effort as a model for other higher education networks.', N'International Office News', 1, 1, 20, 20, CAST(N'2025-08-17T02:20:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'57', N'The Environmental Science Group partnered with local industries for cutting-edge technological advancements', N'Student Affairs: The Environmental Science Group partnered with local industries for cutting-edge technological advan', CAST(N'2024-07-03T17:04:00.000' AS DateTime), N'The Environmental Science Group partnered with local industries for cutting-edge technological advancements.

In a major update from University FU, the environmental science group has officially partnered with local industries for cutting-edge technological advancements. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Preliminary results demonstrate an impressive improvement in key performance metrics across the board.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Several regional publications have highlighted this effort as a model for other higher education networks.', N'International Office News', 2, 1, 6, 9, CAST(N'2024-07-05T01:04:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'58', N'The Student Housing Administration introduced a revised curriculum focusing on advanced deep learning algorithms', N'Campus Safety: The Student Housing Administration introduced a revised curriculum focusing on advanced deep learnin', CAST(N'2026-05-27T08:40:00.000' AS DateTime), N'The Student Housing Administration introduced a revised curriculum focusing on advanced deep learning algorithms.

In a major update from University FU, the student housing administration has officially introduced a revised curriculum focusing on advanced deep learning algorithms. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

This project is expected to revolutionize how students interact with modern tools and methodologies.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Several regional publications have highlighted this effort as a model for other higher education networks.', N'Student Union', 3, 0, 17, 17, CAST(N'2026-05-31T14:40:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'59', N'The Student Affairs Association introduced a revised curriculum focusing on modern cyber-security defense frameworks', N'Alumni News: The Student Affairs Association introduced a revised curriculum focusing on modern cyber-security de', CAST(N'2025-06-21T13:02:00.000' AS DateTime), N'The Student Affairs Association introduced a revised curriculum focusing on modern cyber-security defense frameworks.

In a major update from University FU, the student affairs association has officially introduced a revised curriculum focusing on modern cyber-security defense frameworks. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Preliminary results demonstrate an impressive improvement in key performance metrics across the board.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.', N'Research Center Desk', 4, 1, 15, 11, CAST(N'2025-06-25T15:02:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'60', N'The Business School Faculty organized a university-wide forum regarding high-performance athletic conditioning', N'Capstone Project News: The Business School Faculty organized a university-wide forum regarding high-performance athletic co', CAST(N'2025-11-02T13:29:00.000' AS DateTime), N'The Business School Faculty organized a university-wide forum regarding high-performance athletic conditioning.

In a major update from University FU, the business school faculty has officially organized a university-wide forum regarding high-performance athletic conditioning. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Preliminary results demonstrate an impressive improvement in key performance metrics across the board.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.', N'Tech Division', 5, 1, 4, 19, CAST(N'2025-11-04T14:29:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'61', N'The Health and Wellness Center introduced a revised curriculum focusing on advanced deep learning algorithms', N'Indoor Sports: The Health and Wellness Center introduced a revised curriculum focusing on advanced deep learning al', CAST(N'2024-12-14T14:13:00.000' AS DateTime), N'The Health and Wellness Center introduced a revised curriculum focusing on advanced deep learning algorithms.

In a major update from University FU, the health and wellness center has officially introduced a revised curriculum focusing on advanced deep learning algorithms. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Several regional publications have highlighted this effort as a model for other higher education networks.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.', N'Campus Safety Dispatch', 6, 1, 15, 15, CAST(N'2024-12-14T18:13:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'62', N'The Varsity Esports Club established a strategic alliance with local community educational tutoring', N'Outdoor Sports: The Varsity Esports Club established a strategic alliance with local community educational tutoring', CAST(N'2025-01-27T08:18:00.000' AS DateTime), N'The Varsity Esports Club established a strategic alliance with local community educational tutoring.

In a major update from University FU, the varsity esports club has officially established a strategic alliance with local community educational tutoring. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

This project is expected to revolutionize how students interact with modern tools and methodologies.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Preliminary results demonstrate an impressive improvement in key performance metrics across the board.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Several regional publications have highlighted this effort as a model for other higher education networks.', N'Alumni Association Quarterly', 7, 1, 19, 20, CAST(N'2025-01-27T18:18:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'63', N'The Innovation and Incubation Lab unveiled plans to enhance local community educational tutoring', N'Aquatic Sports: The Innovation and Incubation Lab unveiled plans to enhance local community educational tutoring', CAST(N'2024-11-10T18:37:00.000' AS DateTime), N'The Innovation and Incubation Lab unveiled plans to enhance local community educational tutoring.

In a major update from University FU, the innovation and incubation lab has officially unveiled plans to enhance local community educational tutoring. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Preliminary results demonstrate an impressive improvement in key performance metrics across the board.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Several regional publications have highlighted this effort as a model for other higher education networks.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. The university has committed additional funding to expand this program into subsequent academic semesters.', N'Campus Safety Dispatch', 8, 1, 18, 6, CAST(N'2024-11-13T22:37:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'64', N'The Career Development Center partnered with local industries for interdisciplinary capstone engineering solutions', N'Martial Arts & Combat Sports: The Career Development Center partnered with local industries for interdisciplinary capstone enginee', CAST(N'2025-09-27T15:58:00.000' AS DateTime), N'The Career Development Center partnered with local industries for interdisciplinary capstone engineering solutions.

In a major update from University FU, the career development center has officially partnered with local industries for interdisciplinary capstone engineering solutions. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Preliminary results demonstrate an impressive improvement in key performance metrics across the board.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.', N'Academic Office', 9, 1, 13, 17, CAST(N'2025-09-29T01:58:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'65', N'The Student Housing Administration hosted an international symposium on quantum computing research frontiers', N'E-Sports & Gaming: The Student Housing Administration hosted an international symposium on quantum computing research f', CAST(N'2024-07-02T18:42:00.000' AS DateTime), N'The Student Housing Administration hosted an international symposium on quantum computing research frontiers.

In a major update from University FU, the student housing administration has officially hosted an international symposium on quantum computing research frontiers. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

This project is expected to revolutionize how students interact with modern tools and methodologies.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Preliminary results demonstrate an impressive improvement in key performance metrics across the board.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. The university has committed additional funding to expand this program into subsequent academic semesters.', N'Research Center Desk', 10, 1, 13, 13, CAST(N'2024-07-05T19:42:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'66', N'The Campus Athletics Committee received a prestigious grant to study advanced deep learning algorithms', N'Fitness & Wellness Programs: The Campus Athletics Committee received a prestigious grant to study advanced deep learning algorith', CAST(N'2025-01-25T18:18:00.000' AS DateTime), N'The Campus Athletics Committee received a prestigious grant to study advanced deep learning algorithms.

In a major update from University FU, the campus athletics committee has officially received a prestigious grant to study advanced deep learning algorithms. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Preliminary results demonstrate an impressive improvement in key performance metrics across the board.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. The university has committed additional funding to expand this program into subsequent academic semesters.', N'Student Union', 11, 1, 13, 13, CAST(N'2025-01-30T04:18:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'67', N'The Business School Faculty secured funding for projects related to high-performance athletic conditioning', N'Intramural Sports: The Business School Faculty secured funding for projects related to high-performance athletic condit', CAST(N'2025-12-10T13:55:00.000' AS DateTime), N'The Business School Faculty secured funding for projects related to high-performance athletic conditioning.

In a major update from University FU, the business school faculty has officially secured funding for projects related to high-performance athletic conditioning. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Several regional publications have highlighted this effort as a model for other higher education networks.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. This project is expected to revolutionize how students interact with modern tools and methodologies.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Preliminary results demonstrate an impressive improvement in key performance metrics across the board.', N'International Office News', 12, 1, 6, 6, CAST(N'2025-12-11T20:55:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'68', N'The Library Services Committee unveiled plans to enhance sustainable urban architecture', N'Sports Tournaments & Championships: The Library Services Committee unveiled plans to enhance sustainable urban architecture', CAST(N'2025-04-10T14:54:00.000' AS DateTime), N'The Library Services Committee unveiled plans to enhance sustainable urban architecture.

In a major update from University FU, the library services committee has officially unveiled plans to enhance sustainable urban architecture. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. The university has committed additional funding to expand this program into subsequent academic semesters.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.', N'Academic Office', 13, 1, 10, 10, CAST(N'2025-04-15T00:54:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'69', N'The Business School Faculty introduced a revised curriculum focusing on student mental health advocacy', N'Sports Facilities & Equipment: The Business School Faculty introduced a revised curriculum focusing on student mental health advoca', CAST(N'2024-08-16T15:59:00.000' AS DateTime), N'The Business School Faculty introduced a revised curriculum focusing on student mental health advocacy.

In a major update from University FU, the business school faculty has officially introduced a revised curriculum focusing on student mental health advocacy. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. This project is expected to revolutionize how students interact with modern tools and methodologies.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Preliminary results demonstrate an impressive improvement in key performance metrics across the board.', N'Alumni Association Quarterly', 14, 1, 18, 14, CAST(N'2024-08-21T16:59:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'70', N'The Career Development Center celebrated the milestone achievement of next-generation renewable energy grids', N'Athletic Scholarships & Recruitment: The Career Development Center celebrated the milestone achievement of next-generation renewable ener', CAST(N'2025-02-19T08:19:00.000' AS DateTime), N'The Career Development Center celebrated the milestone achievement of next-generation renewable energy grids.

In a major update from University FU, the career development center has officially celebrated the milestone achievement of next-generation renewable energy grids. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Several regional publications have highlighted this effort as a model for other higher education networks.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. This project is expected to revolutionize how students interact with modern tools and methodologies.', N'Campus Safety Dispatch', 15, 1, 11, 11, CAST(N'2025-02-19T13:19:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'71', N'The Department of Software Engineering published groundbreaking findings on campus emergency response coordination', N'Sports Medicine & Injury Prevention: The Department of Software Engineering published groundbreaking findings on campus emergency respons', CAST(N'2024-07-22T11:38:00.000' AS DateTime), N'The Department of Software Engineering published groundbreaking findings on campus emergency response coordination.

In a major update from University FU, the department of software engineering has officially published groundbreaking findings on campus emergency response coordination. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. This project is expected to revolutionize how students interact with modern tools and methodologies.', N'Student Union', 16, 0, 8, 8, CAST(N'2024-07-23T15:38:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'72', N'The Alumni Relations Network celebrated the milestone achievement of sports medicine and injury prevention', N'Outdoor Adventure & Hiking: The Alumni Relations Network celebrated the milestone achievement of sports medicine and injury prev', CAST(N'2024-11-15T16:19:00.000' AS DateTime), N'The Alumni Relations Network celebrated the milestone achievement of sports medicine and injury prevention.

In a major update from University FU, the alumni relations network has officially celebrated the milestone achievement of sports medicine and injury prevention. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. This project is expected to revolutionize how students interact with modern tools and methodologies.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. The university has committed additional funding to expand this program into subsequent academic semesters.', N'Community Outreach Desk', 17, 1, 16, 9, CAST(N'2024-11-18T19:19:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'73', N'The Campus Security Taskforce upgraded its facilities for sports medicine and injury prevention', N'Dance & Cheerleading: The Campus Security Taskforce upgraded its facilities for sports medicine and injury prevention', CAST(N'2024-09-15T18:28:00.000' AS DateTime), N'The Campus Security Taskforce upgraded its facilities for sports medicine and injury prevention.

In a major update from University FU, the campus security taskforce has officially upgraded its facilities for sports medicine and injury prevention. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Several regional publications have highlighted this effort as a model for other higher education networks.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.', N'Student Union', 18, 1, 14, 14, CAST(N'2024-09-19T23:28:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'74', N'The Artificial Intelligence Division secured funding for projects related to modern cyber-security defense frameworks', N'Health & Wellness: The Artificial Intelligence Division secured funding for projects related to modern cyber-security d', CAST(N'2024-10-19T17:17:00.000' AS DateTime), N'The Artificial Intelligence Division secured funding for projects related to modern cyber-security defense frameworks.

In a major update from University FU, the artificial intelligence division has officially secured funding for projects related to modern cyber-security defense frameworks. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. The university has committed additional funding to expand this program into subsequent academic semesters.', N'Tech Division', 19, 1, 19, 19, CAST(N'2024-10-22T22:17:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'75', N'The Business School Faculty secured funding for projects related to campus emergency response coordination', N'Career Services: The Business School Faculty secured funding for projects related to campus emergency response coordi', CAST(N'2025-01-23T12:11:00.000' AS DateTime), N'The Business School Faculty secured funding for projects related to campus emergency response coordination.

In a major update from University FU, the business school faculty has officially secured funding for projects related to campus emergency response coordination. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

This project is expected to revolutionize how students interact with modern tools and methodologies.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Several regional publications have highlighted this effort as a model for other higher education networks.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.', N'Academic Office', 20, 1, 4, 16, CAST(N'2025-01-27T13:11:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'76', N'The Global Partnerships Board celebrated the milestone achievement of post-graduation alumni career acceleration', N'International Students: The Global Partnerships Board celebrated the milestone achievement of post-graduation alumni career ', CAST(N'2025-03-29T08:45:00.000' AS DateTime), N'The Global Partnerships Board celebrated the milestone achievement of post-graduation alumni career acceleration.

In a major update from University FU, the global partnerships board has officially celebrated the milestone achievement of post-graduation alumni career acceleration. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Several regional publications have highlighted this effort as a model for other higher education networks.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. The university has committed additional funding to expand this program into subsequent academic semesters.', N'Student Union', 21, 1, 9, 13, CAST(N'2025-04-02T11:45:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'77', N'The Alumni Relations Network celebrated the milestone achievement of cross-cultural student exchanges', N'Technology & Innovation: The Alumni Relations Network celebrated the milestone achievement of cross-cultural student exchange', CAST(N'2025-06-27T10:06:00.000' AS DateTime), N'The Alumni Relations Network celebrated the milestone achievement of cross-cultural student exchanges.

In a major update from University FU, the alumni relations network has officially celebrated the milestone achievement of cross-cultural student exchanges. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Several regional publications have highlighted this effort as a model for other higher education networks.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.', N'Academic Office', 22, 1, 10, 15, CAST(N'2025-07-02T14:06:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'78', N'The Innovation and Incubation Lab celebrated the milestone achievement of interdisciplinary capstone engineering solutions', N'Arts & Culture: The Innovation and Incubation Lab celebrated the milestone achievement of interdisciplinary capstone', CAST(N'2025-12-27T17:41:00.000' AS DateTime), N'The Innovation and Incubation Lab celebrated the milestone achievement of interdisciplinary capstone engineering solutions.

In a major update from University FU, the innovation and incubation lab has officially celebrated the milestone achievement of interdisciplinary capstone engineering solutions. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Preliminary results demonstrate an impressive improvement in key performance metrics across the board.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. This project is expected to revolutionize how students interact with modern tools and methodologies.', N'Campus Safety Dispatch', 23, 1, 11, 18, CAST(N'2025-12-31T21:41:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'79', N'The Varsity Esports Club partnered with local industries for innovative agricultural ecosystems', N'Research & Grants: The Varsity Esports Club partnered with local industries for innovative agricultural ecosystems', CAST(N'2024-12-06T15:41:00.000' AS DateTime), N'The Varsity Esports Club partnered with local industries for innovative agricultural ecosystems.

In a major update from University FU, the varsity esports club has officially partnered with local industries for innovative agricultural ecosystems. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.', N'Community Outreach Desk', 24, 1, 8, 8, CAST(N'2024-12-06T19:41:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'80', N'The Global Partnerships Board celebrated the milestone achievement of local community educational tutoring', N'Community Outreach: The Global Partnerships Board celebrated the milestone achievement of local community educational tu', CAST(N'2025-09-14T10:14:00.000' AS DateTime), N'The Global Partnerships Board celebrated the milestone achievement of local community educational tutoring.

In a major update from University FU, the global partnerships board has officially celebrated the milestone achievement of local community educational tutoring. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

This project is expected to revolutionize how students interact with modern tools and methodologies.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. The university has committed additional funding to expand this program into subsequent academic semesters.', N'Student Union', 25, 1, 4, 15, CAST(N'2025-09-15T11:14:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'81', N'The Department of Software Engineering published groundbreaking findings on interdisciplinary capstone engineering solutions', N'Facilities & Infrastructure: The Department of Software Engineering published groundbreaking findings on interdisciplinary capsto', CAST(N'2025-09-16T09:20:00.000' AS DateTime), N'The Department of Software Engineering published groundbreaking findings on interdisciplinary capstone engineering solutions.

In a major update from University FU, the department of software engineering has officially published groundbreaking findings on interdisciplinary capstone engineering solutions. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Several regional publications have highlighted this effort as a model for other higher education networks.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. The university has committed additional funding to expand this program into subsequent academic semesters.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.', N'Athletics Office', 26, 1, 16, 16, CAST(N'2025-09-17T12:20:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'82', N'The Library Services Committee established a strategic alliance with innovative agricultural ecosystems', N'Environment & Sustainability: The Library Services Committee established a strategic alliance with innovative agricultural ecosyst', CAST(N'2024-09-13T13:42:00.000' AS DateTime), N'The Library Services Committee established a strategic alliance with innovative agricultural ecosystems.

In a major update from University FU, the library services committee has officially established a strategic alliance with innovative agricultural ecosystems. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Preliminary results demonstrate an impressive improvement in key performance metrics across the board.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. The university has committed additional funding to expand this program into subsequent academic semesters.', N'International Office News', 27, 1, 14, 1, CAST(N'2024-09-15T15:42:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'83', N'The Global Partnerships Board secured funding for projects related to local community educational tutoring', N'Scholarships & Financial Aid: The Global Partnerships Board secured funding for projects related to local community educational tu', CAST(N'2025-12-11T10:42:00.000' AS DateTime), N'The Global Partnerships Board secured funding for projects related to local community educational tutoring.

In a major update from University FU, the global partnerships board has officially secured funding for projects related to local community educational tutoring. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Preliminary results demonstrate an impressive improvement in key performance metrics across the board.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Several regional publications have highlighted this effort as a model for other higher education networks.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.', N'Research Center Desk', 28, 1, 20, 20, CAST(N'2025-12-15T16:42:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'84', N'The Business School Faculty hosted an international symposium on interdisciplinary capstone engineering solutions', N'Athletics & Recreation: The Business School Faculty hosted an international symposium on interdisciplinary capstone engineer', CAST(N'2025-11-12T13:34:00.000' AS DateTime), N'The Business School Faculty hosted an international symposium on interdisciplinary capstone engineering solutions.

In a major update from University FU, the business school faculty has officially hosted an international symposium on interdisciplinary capstone engineering solutions. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. This project is expected to revolutionize how students interact with modern tools and methodologies.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Several regional publications have highlighted this effort as a model for other higher education networks.', N'Athletics Office', 29, 1, 19, 7, CAST(N'2025-11-17T22:34:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'85', N'The Campus Athletics Committee organized a university-wide forum regarding creative visual arts exhibitions', N'Administration & Governance: The Campus Athletics Committee organized a university-wide forum regarding creative visual arts exhi', CAST(N'2025-08-29T14:39:00.000' AS DateTime), N'The Campus Athletics Committee organized a university-wide forum regarding creative visual arts exhibitions.

In a major update from University FU, the campus athletics committee has officially organized a university-wide forum regarding creative visual arts exhibitions. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

This project is expected to revolutionize how students interact with modern tools and methodologies.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Preliminary results demonstrate an impressive improvement in key performance metrics across the board.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Several regional publications have highlighted this effort as a model for other higher education networks.', N'Research Center Desk', 30, 0, 11, 11, CAST(N'2025-09-03T15:39:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'86', N'The Performing Arts Ensemble hosted an international symposium on local community educational tutoring', N'Community Services: The Performing Arts Ensemble hosted an international symposium on local community educational tutori', CAST(N'2025-12-31T17:05:00.000' AS DateTime), N'The Performing Arts Ensemble hosted an international symposium on local community educational tutoring.

In a major update from University FU, the performing arts ensemble has officially hosted an international symposium on local community educational tutoring. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Preliminary results demonstrate an impressive improvement in key performance metrics across the board.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Several regional publications have highlighted this effort as a model for other higher education networks.', N'Athletics Office', 31, 1, 2, 2, CAST(N'2026-01-03T03:05:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'87', N'The Capstone Project Council introduced a revised curriculum focusing on advanced deep learning algorithms', N'Student Union Announcements: The Capstone Project Council introduced a revised curriculum focusing on advanced deep learning algo', CAST(N'2024-10-10T11:12:00.000' AS DateTime), N'The Capstone Project Council introduced a revised curriculum focusing on advanced deep learning algorithms.

In a major update from University FU, the capstone project council has officially introduced a revised curriculum focusing on advanced deep learning algorithms. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

The university has committed additional funding to expand this program into subsequent academic semesters.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Several regional publications have highlighted this effort as a model for other higher education networks.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.', N'FU Communications', 32, 0, 20, 20, CAST(N'2024-10-11T13:12:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'88', N'The Health and Wellness Center introduced a revised curriculum focusing on sustainable urban architecture', N'Global Partnerships: The Health and Wellness Center introduced a revised curriculum focusing on sustainable urban archite', CAST(N'2025-01-22T09:22:00.000' AS DateTime), N'The Health and Wellness Center introduced a revised curriculum focusing on sustainable urban architecture.

In a major update from University FU, the health and wellness center has officially introduced a revised curriculum focusing on sustainable urban architecture. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. This project is expected to revolutionize how students interact with modern tools and methodologies.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Several regional publications have highlighted this effort as a model for other higher education networks.', N'Tech Division', 33, 1, 2, 12, CAST(N'2025-01-22T12:22:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'89', N'The Health and Wellness Center launched a new initiative targeting financial aid accessibility policies', N'Student Housing & Dorms: The Health and Wellness Center launched a new initiative targeting financial aid accessibility polic', CAST(N'2025-06-06T18:55:00.000' AS DateTime), N'The Health and Wellness Center launched a new initiative targeting financial aid accessibility policies.

In a major update from University FU, the health and wellness center has officially launched a new initiative targeting financial aid accessibility policies. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

The university has committed additional funding to expand this program into subsequent academic semesters.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Several regional publications have highlighted this effort as a model for other higher education networks.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. This project is expected to revolutionize how students interact with modern tools and methodologies.', N'Student Union', 34, 1, 10, 10, CAST(N'2025-06-07T02:55:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'90', N'The Career Development Center published groundbreaking findings on local community educational tutoring', N'Alumni Success Stories: The Career Development Center published groundbreaking findings on local community educational tutor', CAST(N'2024-12-19T10:17:00.000' AS DateTime), N'The Career Development Center published groundbreaking findings on local community educational tutoring.

In a major update from University FU, the career development center has officially published groundbreaking findings on local community educational tutoring. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Several regional publications have highlighted this effort as a model for other higher education networks.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. The university has committed additional funding to expand this program into subsequent academic semesters.', N'Research Center Desk', 35, 1, 8, 17, CAST(N'2024-12-19T13:17:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'91', N'The Student Housing Administration upgraded its facilities for local community educational tutoring', N'Academic news: The Student Housing Administration upgraded its facilities for local community educational tutoring', CAST(N'2025-01-16T15:58:00.000' AS DateTime), N'The Student Housing Administration upgraded its facilities for local community educational tutoring.

In a major update from University FU, the student housing administration has officially upgraded its facilities for local community educational tutoring. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Preliminary results demonstrate an impressive improvement in key performance metrics across the board.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.', N'International Office News', 1, 1, 15, 15, CAST(N'2025-01-20T23:58:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'92', N'The Capstone Project Council organized a university-wide forum regarding advanced deep learning algorithms', N'Student Affairs: The Capstone Project Council organized a university-wide forum regarding advanced deep learning algo', CAST(N'2025-03-27T14:53:00.000' AS DateTime), N'The Capstone Project Council organized a university-wide forum regarding advanced deep learning algorithms.

In a major update from University FU, the capstone project council has officially organized a university-wide forum regarding advanced deep learning algorithms. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

The university has committed additional funding to expand this program into subsequent academic semesters.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. This project is expected to revolutionize how students interact with modern tools and methodologies.', N'Student Union', 2, 1, 4, 5, CAST(N'2025-03-29T22:53:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'93', N'The Health and Wellness Center introduced a revised curriculum focusing on sustainable urban architecture', N'Campus Safety: The Health and Wellness Center introduced a revised curriculum focusing on sustainable urban archite', CAST(N'2024-07-02T08:54:00.000' AS DateTime), N'The Health and Wellness Center introduced a revised curriculum focusing on sustainable urban architecture.

In a major update from University FU, the health and wellness center has officially introduced a revised curriculum focusing on sustainable urban architecture. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. This project is expected to revolutionize how students interact with modern tools and methodologies.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. The university has committed additional funding to expand this program into subsequent academic semesters.', N'Alumni Association Quarterly', 3, 1, 15, 15, CAST(N'2024-07-04T12:54:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'94', N'The Campus Athletics Committee celebrated the milestone achievement of post-graduation alumni career acceleration', N'Alumni News: The Campus Athletics Committee celebrated the milestone achievement of post-graduation alumni career', CAST(N'2024-07-03T17:21:00.000' AS DateTime), N'The Campus Athletics Committee celebrated the milestone achievement of post-graduation alumni career acceleration.

In a major update from University FU, the campus athletics committee has officially celebrated the milestone achievement of post-graduation alumni career acceleration. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. This project is expected to revolutionize how students interact with modern tools and methodologies.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.', N'Alumni Association Quarterly', 4, 1, 18, 8, CAST(N'2024-07-08T22:21:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'95', N'The Alumni Relations Network launched a new initiative targeting financial aid accessibility policies', N'Capstone Project News: The Alumni Relations Network launched a new initiative targeting financial aid accessibility policie', CAST(N'2026-02-28T09:51:00.000' AS DateTime), N'The Alumni Relations Network launched a new initiative targeting financial aid accessibility policies.

In a major update from University FU, the alumni relations network has officially launched a new initiative targeting financial aid accessibility policies. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

This project is expected to revolutionize how students interact with modern tools and methodologies.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. The university has committed additional funding to expand this program into subsequent academic semesters.', N'Student Union', 5, 1, 12, 12, CAST(N'2026-02-28T19:51:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'96', N'The Library Services Committee secured funding for projects related to next-generation renewable energy grids', N'Indoor Sports: The Library Services Committee secured funding for projects related to next-generation renewable ene', CAST(N'2024-12-23T08:16:00.000' AS DateTime), N'The Library Services Committee secured funding for projects related to next-generation renewable energy grids.

In a major update from University FU, the library services committee has officially secured funding for projects related to next-generation renewable energy grids. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

The university has committed additional funding to expand this program into subsequent academic semesters.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Preliminary results demonstrate an impressive improvement in key performance metrics across the board.', N'Alumni Association Quarterly', 6, 1, 15, 15, CAST(N'2024-12-23T09:16:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'97', N'The Library Services Committee celebrated the milestone achievement of campus emergency response coordination', N'Outdoor Sports: The Library Services Committee celebrated the milestone achievement of campus emergency response coo', CAST(N'2025-04-03T16:08:00.000' AS DateTime), N'The Library Services Committee celebrated the milestone achievement of campus emergency response coordination.

In a major update from University FU, the library services committee has officially celebrated the milestone achievement of campus emergency response coordination. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Preliminary results demonstrate an impressive improvement in key performance metrics across the board.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.', N'Tech Division', 7, 1, 7, 16, CAST(N'2025-04-05T17:08:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'98', N'The Global Partnerships Board organized a university-wide forum regarding quantum computing research frontiers', N'Aquatic Sports: The Global Partnerships Board organized a university-wide forum regarding quantum computing research', CAST(N'2025-10-07T17:41:00.000' AS DateTime), N'The Global Partnerships Board organized a university-wide forum regarding quantum computing research frontiers.

In a major update from University FU, the global partnerships board has officially organized a university-wide forum regarding quantum computing research frontiers. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Several regional publications have highlighted this effort as a model for other higher education networks.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. The university has committed additional funding to expand this program into subsequent academic semesters.', N'Athletics Office', 8, 1, 15, 15, CAST(N'2025-10-13T00:41:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'99', N'The Health and Wellness Center upgraded its facilities for cross-cultural student exchanges', N'Martial Arts & Combat Sports: The Health and Wellness Center upgraded its facilities for cross-cultural student exchanges', CAST(N'2025-09-16T14:30:00.000' AS DateTime), N'The Health and Wellness Center upgraded its facilities for cross-cultural student exchanges.

In a major update from University FU, the health and wellness center has officially upgraded its facilities for cross-cultural student exchanges. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Preliminary results demonstrate an impressive improvement in key performance metrics across the board.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Several regional publications have highlighted this effort as a model for other higher education networks.', N'FU Communications', 9, 1, 2, 2, CAST(N'2025-09-20T19:30:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'100', N'The Innovation and Incubation Lab launched a new initiative targeting creative visual arts exhibitions', N'E-Sports & Gaming: The Innovation and Incubation Lab launched a new initiative targeting creative visual arts exhibitio', CAST(N'2026-05-16T09:52:00.000' AS DateTime), N'The Innovation and Incubation Lab launched a new initiative targeting creative visual arts exhibitions.

In a major update from University FU, the innovation and incubation lab has officially launched a new initiative targeting creative visual arts exhibitions. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. The university has committed additional funding to expand this program into subsequent academic semesters.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Several regional publications have highlighted this effort as a model for other higher education networks.', N'Athletics Office', 10, 1, 7, 7, CAST(N'2026-05-20T11:52:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'101', N'The Campus Athletics Committee upgraded its facilities for high-performance athletic conditioning', N'Fitness & Wellness Programs: The Campus Athletics Committee upgraded its facilities for high-performance athletic conditioning', CAST(N'2026-02-11T12:28:00.000' AS DateTime), N'The Campus Athletics Committee upgraded its facilities for high-performance athletic conditioning.

In a major update from University FU, the campus athletics committee has officially upgraded its facilities for high-performance athletic conditioning. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

This project is expected to revolutionize how students interact with modern tools and methodologies.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Preliminary results demonstrate an impressive improvement in key performance metrics across the board.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Several regional publications have highlighted this effort as a model for other higher education networks.', N'International Office News', 11, 1, 16, 16, CAST(N'2026-02-12T21:28:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'102', N'The Student Housing Administration upgraded its facilities for campus emergency response coordination', N'Intramural Sports: The Student Housing Administration upgraded its facilities for campus emergency response coordinatio', CAST(N'2024-11-28T12:55:00.000' AS DateTime), N'The Student Housing Administration upgraded its facilities for campus emergency response coordination.

In a major update from University FU, the student housing administration has officially upgraded its facilities for campus emergency response coordination. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Several regional publications have highlighted this effort as a model for other higher education networks.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.', N'Academic Office', 12, 0, 16, 16, CAST(N'2024-12-02T14:55:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'103', N'The Alumni Relations Network celebrated the milestone achievement of modern cyber-security defense frameworks', N'Sports Tournaments & Championships: The Alumni Relations Network celebrated the milestone achievement of modern cyber-security defense f', CAST(N'2024-10-28T10:46:00.000' AS DateTime), N'The Alumni Relations Network celebrated the milestone achievement of modern cyber-security defense frameworks.

In a major update from University FU, the alumni relations network has officially celebrated the milestone achievement of modern cyber-security defense frameworks. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

This project is expected to revolutionize how students interact with modern tools and methodologies.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Preliminary results demonstrate an impressive improvement in key performance metrics across the board.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.', N'Campus Safety Dispatch', 13, 1, 3, 3, CAST(N'2024-10-28T19:46:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'104', N'The Library Services Committee received a prestigious grant to study advanced deep learning algorithms', N'Sports Facilities & Equipment: The Library Services Committee received a prestigious grant to study advanced deep learning algorith', CAST(N'2024-09-27T09:42:00.000' AS DateTime), N'The Library Services Committee received a prestigious grant to study advanced deep learning algorithms.

In a major update from University FU, the library services committee has officially received a prestigious grant to study advanced deep learning algorithms. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. The university has committed additional funding to expand this program into subsequent academic semesters.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. This project is expected to revolutionize how students interact with modern tools and methodologies.', N'Campus Safety Dispatch', 14, 1, 20, 20, CAST(N'2024-09-30T14:42:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'105', N'The Environmental Science Group received a prestigious grant to study interdisciplinary capstone engineering solutions', N'Athletic Scholarships & Recruitment: The Environmental Science Group received a prestigious grant to study interdisciplinary capstone eng', CAST(N'2024-07-02T12:52:00.000' AS DateTime), N'The Environmental Science Group received a prestigious grant to study interdisciplinary capstone engineering solutions.

In a major update from University FU, the environmental science group has officially received a prestigious grant to study interdisciplinary capstone engineering solutions. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Preliminary results demonstrate an impressive improvement in key performance metrics across the board.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. This project is expected to revolutionize how students interact with modern tools and methodologies.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Several regional publications have highlighted this effort as a model for other higher education networks.', N'Academic Office', 15, 1, 3, 3, CAST(N'2024-07-05T15:52:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'106', N'The Performing Arts Ensemble celebrated the milestone achievement of post-graduation alumni career acceleration', N'Sports Medicine & Injury Prevention: The Performing Arts Ensemble celebrated the milestone achievement of post-graduation alumni career a', CAST(N'2025-09-22T08:53:00.000' AS DateTime), N'The Performing Arts Ensemble celebrated the milestone achievement of post-graduation alumni career acceleration.

In a major update from University FU, the performing arts ensemble has officially celebrated the milestone achievement of post-graduation alumni career acceleration. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

This project is expected to revolutionize how students interact with modern tools and methodologies.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Preliminary results demonstrate an impressive improvement in key performance metrics across the board.', N'Tech Division', 16, 1, 7, 3, CAST(N'2025-09-26T14:53:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'107', N'The Capstone Project Council unveiled plans to enhance next-generation renewable energy grids', N'Outdoor Adventure & Hiking: The Capstone Project Council unveiled plans to enhance next-generation renewable energy grids', CAST(N'2026-03-09T16:23:00.000' AS DateTime), N'The Capstone Project Council unveiled plans to enhance next-generation renewable energy grids.

In a major update from University FU, the capstone project council has officially unveiled plans to enhance next-generation renewable energy grids. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Several regional publications have highlighted this effort as a model for other higher education networks.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. This project is expected to revolutionize how students interact with modern tools and methodologies.', N'Research Center Desk', 17, 0, 17, 5, CAST(N'2026-03-13T20:23:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'108', N'The Career Development Center celebrated the milestone achievement of sustainable urban architecture', N'Dance & Cheerleading: The Career Development Center celebrated the milestone achievement of sustainable urban architecture', CAST(N'2025-01-04T17:37:00.000' AS DateTime), N'The Career Development Center celebrated the milestone achievement of sustainable urban architecture.

In a major update from University FU, the career development center has officially celebrated the milestone achievement of sustainable urban architecture. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Several regional publications have highlighted this effort as a model for other higher education networks.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. The university has committed additional funding to expand this program into subsequent academic semesters.', N'Campus Safety Dispatch', 18, 1, 5, 5, CAST(N'2025-01-09T01:37:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'109', N'The Campus Athletics Committee published groundbreaking findings on next-generation renewable energy grids', N'Health & Wellness: The Campus Athletics Committee published groundbreaking findings on next-generation renewable energy', CAST(N'2024-12-03T14:53:00.000' AS DateTime), N'The Campus Athletics Committee published groundbreaking findings on next-generation renewable energy grids.

In a major update from University FU, the campus athletics committee has officially published groundbreaking findings on next-generation renewable energy grids. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

The university has committed additional funding to expand this program into subsequent academic semesters.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. This project is expected to revolutionize how students interact with modern tools and methodologies.', N'Campus Safety Dispatch', 19, 1, 1, 13, CAST(N'2024-12-06T00:53:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'110', N'The Student Affairs Association secured funding for projects related to sports medicine and injury prevention', N'Career Services: The Student Affairs Association secured funding for projects related to sports medicine and injury p', CAST(N'2026-04-17T15:47:00.000' AS DateTime), N'The Student Affairs Association secured funding for projects related to sports medicine and injury prevention.

In a major update from University FU, the student affairs association has officially secured funding for projects related to sports medicine and injury prevention. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Preliminary results demonstrate an impressive improvement in key performance metrics across the board.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.', N'Tech Division', 20, 1, 10, 12, CAST(N'2026-04-17T19:47:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'111', N'The Innovation and Incubation Lab secured funding for projects related to interdisciplinary capstone engineering solutions', N'International Students: The Innovation and Incubation Lab secured funding for projects related to interdisciplinary capstone', CAST(N'2025-05-10T11:07:00.000' AS DateTime), N'The Innovation and Incubation Lab secured funding for projects related to interdisciplinary capstone engineering solutions.

In a major update from University FU, the innovation and incubation lab has officially secured funding for projects related to interdisciplinary capstone engineering solutions. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

The university has committed additional funding to expand this program into subsequent academic semesters.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Several regional publications have highlighted this effort as a model for other higher education networks.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.', N'International Office News', 21, 1, 4, 7, CAST(N'2025-05-11T15:07:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'112', N'The Campus Security Taskforce unveiled plans to enhance local community educational tutoring', N'Technology & Innovation: The Campus Security Taskforce unveiled plans to enhance local community educational tutoring', CAST(N'2025-02-14T10:48:00.000' AS DateTime), N'The Campus Security Taskforce unveiled plans to enhance local community educational tutoring.

In a major update from University FU, the campus security taskforce has officially unveiled plans to enhance local community educational tutoring. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Several regional publications have highlighted this effort as a model for other higher education networks.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. The university has committed additional funding to expand this program into subsequent academic semesters.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. This project is expected to revolutionize how students interact with modern tools and methodologies.', N'International Office News', 22, 1, 16, 7, CAST(N'2025-02-15T17:48:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'113', N'The Innovation and Incubation Lab celebrated the milestone achievement of interdisciplinary capstone engineering solutions', N'Arts & Culture: The Innovation and Incubation Lab celebrated the milestone achievement of interdisciplinary capstone', CAST(N'2026-04-13T15:47:00.000' AS DateTime), N'The Innovation and Incubation Lab celebrated the milestone achievement of interdisciplinary capstone engineering solutions.

In a major update from University FU, the innovation and incubation lab has officially celebrated the milestone achievement of interdisciplinary capstone engineering solutions. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

The university has committed additional funding to expand this program into subsequent academic semesters.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Several regional publications have highlighted this effort as a model for other higher education networks.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.', N'Athletics Office', 23, 1, 4, 1, CAST(N'2026-04-17T01:47:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'114', N'The Artificial Intelligence Division upgraded its facilities for sports medicine and injury prevention', N'Research & Grants: The Artificial Intelligence Division upgraded its facilities for sports medicine and injury preventi', CAST(N'2025-09-07T08:57:00.000' AS DateTime), N'The Artificial Intelligence Division upgraded its facilities for sports medicine and injury prevention.

In a major update from University FU, the artificial intelligence division has officially upgraded its facilities for sports medicine and injury prevention. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. This project is expected to revolutionize how students interact with modern tools and methodologies.', N'Tech Division', 24, 1, 1, 5, CAST(N'2025-09-11T17:57:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'115', N'The Campus Security Taskforce organized a university-wide forum regarding high-performance athletic conditioning', N'Community Outreach: The Campus Security Taskforce organized a university-wide forum regarding high-performance athletic ', CAST(N'2025-08-20T18:43:00.000' AS DateTime), N'The Campus Security Taskforce organized a university-wide forum regarding high-performance athletic conditioning.

In a major update from University FU, the campus security taskforce has officially organized a university-wide forum regarding high-performance athletic conditioning. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

The university has committed additional funding to expand this program into subsequent academic semesters.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Several regional publications have highlighted this effort as a model for other higher education networks.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.', N'Academic Office', 25, 1, 9, 9, CAST(N'2025-08-23T03:43:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'116', N'The Student Affairs Association secured funding for projects related to quantum computing research frontiers', N'Facilities & Infrastructure: The Student Affairs Association secured funding for projects related to quantum computing research f', CAST(N'2025-04-17T09:04:00.000' AS DateTime), N'The Student Affairs Association secured funding for projects related to quantum computing research frontiers.

In a major update from University FU, the student affairs association has officially secured funding for projects related to quantum computing research frontiers. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

This project is expected to revolutionize how students interact with modern tools and methodologies.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Preliminary results demonstrate an impressive improvement in key performance metrics across the board.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Several regional publications have highlighted this effort as a model for other higher education networks.', N'Academic Office', 26, 1, 13, 13, CAST(N'2025-04-17T13:04:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'117', N'The Library Services Committee unveiled plans to enhance creative visual arts exhibitions', N'Environment & Sustainability: The Library Services Committee unveiled plans to enhance creative visual arts exhibitions', CAST(N'2024-11-29T16:36:00.000' AS DateTime), N'The Library Services Committee unveiled plans to enhance creative visual arts exhibitions.

In a major update from University FU, the library services committee has officially unveiled plans to enhance creative visual arts exhibitions. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Preliminary results demonstrate an impressive improvement in key performance metrics across the board.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. The university has committed additional funding to expand this program into subsequent academic semesters.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.', N'FU Communications', 27, 1, 5, 5, CAST(N'2024-12-04T21:36:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'118', N'The Health and Wellness Center organized a university-wide forum regarding interdisciplinary capstone engineering solutions', N'Scholarships & Financial Aid: The Health and Wellness Center organized a university-wide forum regarding interdisciplinary capston', CAST(N'2025-12-24T09:10:00.000' AS DateTime), N'The Health and Wellness Center organized a university-wide forum regarding interdisciplinary capstone engineering solutions.

In a major update from University FU, the health and wellness center has officially organized a university-wide forum regarding interdisciplinary capstone engineering solutions. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Several regional publications have highlighted this effort as a model for other higher education networks.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. The university has committed additional funding to expand this program into subsequent academic semesters.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.', N'Alumni Association Quarterly', 28, 1, 17, 9, CAST(N'2025-12-25T13:10:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'119', N'The Artificial Intelligence Division celebrated the milestone achievement of student mental health advocacy', N'Athletics & Recreation: The Artificial Intelligence Division celebrated the milestone achievement of student mental health a', CAST(N'2025-03-22T16:27:00.000' AS DateTime), N'The Artificial Intelligence Division celebrated the milestone achievement of student mental health advocacy.

In a major update from University FU, the artificial intelligence division has officially celebrated the milestone achievement of student mental health advocacy. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Preliminary results demonstrate an impressive improvement in key performance metrics across the board.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Several regional publications have highlighted this effort as a model for other higher education networks.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.', N'Campus Safety Dispatch', 29, 1, 2, 2, CAST(N'2025-03-24T21:27:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'120', N'The Department of Software Engineering hosted an international symposium on cross-cultural student exchanges', N'Administration & Governance: The Department of Software Engineering hosted an international symposium on cross-cultural student e', CAST(N'2024-07-27T15:26:00.000' AS DateTime), N'The Department of Software Engineering hosted an international symposium on cross-cultural student exchanges.

In a major update from University FU, the department of software engineering has officially hosted an international symposium on cross-cultural student exchanges. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

This project is expected to revolutionize how students interact with modern tools and methodologies.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Several regional publications have highlighted this effort as a model for other higher education networks.', N'International Office News', 30, 1, 18, 6, CAST(N'2024-07-28T22:26:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'121', N'The Capstone Project Council established a strategic alliance with high-performance athletic conditioning', N'Community Services: The Capstone Project Council established a strategic alliance with high-performance athletic conditi', CAST(N'2024-08-28T09:02:00.000' AS DateTime), N'The Capstone Project Council established a strategic alliance with high-performance athletic conditioning.

In a major update from University FU, the capstone project council has officially established a strategic alliance with high-performance athletic conditioning. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Preliminary results demonstrate an impressive improvement in key performance metrics across the board.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. The university has committed additional funding to expand this program into subsequent academic semesters.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.', N'Alumni Association Quarterly', 31, 1, 7, 7, CAST(N'2024-08-29T18:02:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'122', N'The Artificial Intelligence Division launched a new initiative targeting student mental health advocacy', N'Student Union Announcements: The Artificial Intelligence Division launched a new initiative targeting student mental health advoc', CAST(N'2025-06-16T12:47:00.000' AS DateTime), N'The Artificial Intelligence Division launched a new initiative targeting student mental health advocacy.

In a major update from University FU, the artificial intelligence division has officially launched a new initiative targeting student mental health advocacy. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Several regional publications have highlighted this effort as a model for other higher education networks.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. This project is expected to revolutionize how students interact with modern tools and methodologies.', N'Tech Division', 32, 1, 19, 19, CAST(N'2025-06-16T17:47:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'123', N'The Alumni Relations Network established a strategic alliance with creative visual arts exhibitions', N'Global Partnerships: The Alumni Relations Network established a strategic alliance with creative visual arts exhibitions', CAST(N'2026-03-19T12:14:00.000' AS DateTime), N'The Alumni Relations Network established a strategic alliance with creative visual arts exhibitions.

In a major update from University FU, the alumni relations network has officially established a strategic alliance with creative visual arts exhibitions. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Several regional publications have highlighted this effort as a model for other higher education networks.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. The university has committed additional funding to expand this program into subsequent academic semesters.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. This project is expected to revolutionize how students interact with modern tools and methodologies.', N'Athletics Office', 33, 1, 5, 3, CAST(N'2026-03-23T16:14:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'124', N'The Varsity Esports Club celebrated the milestone achievement of innovative agricultural ecosystems', N'Student Housing & Dorms: The Varsity Esports Club celebrated the milestone achievement of innovative agricultural ecosystems', CAST(N'2024-08-31T09:54:00.000' AS DateTime), N'The Varsity Esports Club celebrated the milestone achievement of innovative agricultural ecosystems.

In a major update from University FU, the varsity esports club has officially celebrated the milestone achievement of innovative agricultural ecosystems. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Several regional publications have highlighted this effort as a model for other higher education networks.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. The university has committed additional funding to expand this program into subsequent academic semesters.', N'International Office News', 34, 1, 16, 16, CAST(N'2024-09-04T12:54:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'125', N'The Artificial Intelligence Division unveiled plans to enhance modern cyber-security defense frameworks', N'Alumni Success Stories: The Artificial Intelligence Division unveiled plans to enhance modern cyber-security defense framewo', CAST(N'2025-10-02T15:04:00.000' AS DateTime), N'The Artificial Intelligence Division unveiled plans to enhance modern cyber-security defense frameworks.

In a major update from University FU, the artificial intelligence division has officially unveiled plans to enhance modern cyber-security defense frameworks. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.', N'Research Center Desk', 35, 1, 20, 20, CAST(N'2025-10-07T18:04:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'126', N'The Student Affairs Association established a strategic alliance with financial aid accessibility policies', N'Academic news: The Student Affairs Association established a strategic alliance with financial aid accessibility po', CAST(N'2026-01-08T10:25:00.000' AS DateTime), N'The Student Affairs Association established a strategic alliance with financial aid accessibility policies.

In a major update from University FU, the student affairs association has officially established a strategic alliance with financial aid accessibility policies. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. The university has committed additional funding to expand this program into subsequent academic semesters.', N'Community Outreach Desk', 1, 1, 10, 10, CAST(N'2026-01-10T17:25:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'127', N'The Library Services Committee published groundbreaking findings on advanced deep learning algorithms', N'Student Affairs: The Library Services Committee published groundbreaking findings on advanced deep learning algorithm', CAST(N'2026-02-21T15:15:00.000' AS DateTime), N'The Library Services Committee published groundbreaking findings on advanced deep learning algorithms.

In a major update from University FU, the library services committee has officially published groundbreaking findings on advanced deep learning algorithms. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Preliminary results demonstrate an impressive improvement in key performance metrics across the board.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Several regional publications have highlighted this effort as a model for other higher education networks.', N'Student Union', 2, 1, 9, 9, CAST(N'2026-02-26T17:15:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'128', N'The Department of Software Engineering introduced a revised curriculum focusing on innovative agricultural ecosystems', N'Campus Safety: The Department of Software Engineering introduced a revised curriculum focusing on innovative agricu', CAST(N'2025-03-01T14:13:00.000' AS DateTime), N'The Department of Software Engineering introduced a revised curriculum focusing on innovative agricultural ecosystems.

In a major update from University FU, the department of software engineering has officially introduced a revised curriculum focusing on innovative agricultural ecosystems. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Preliminary results demonstrate an impressive improvement in key performance metrics across the board.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.', N'International Office News', 3, 1, 20, 18, CAST(N'2025-03-02T19:13:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'129', N'The Campus Security Taskforce hosted an international symposium on advanced deep learning algorithms', N'Alumni News: The Campus Security Taskforce hosted an international symposium on advanced deep learning algorithms', CAST(N'2025-09-19T13:00:00.000' AS DateTime), N'The Campus Security Taskforce hosted an international symposium on advanced deep learning algorithms.

In a major update from University FU, the campus security taskforce has officially hosted an international symposium on advanced deep learning algorithms. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

This project is expected to revolutionize how students interact with modern tools and methodologies.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Several regional publications have highlighted this effort as a model for other higher education networks.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.', N'International Office News', 4, 1, 14, 7, CAST(N'2025-09-19T20:00:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'130', N'The Environmental Science Group received a prestigious grant to study local community educational tutoring', N'Capstone Project News: The Environmental Science Group received a prestigious grant to study local community educational tu', CAST(N'2026-04-21T13:21:00.000' AS DateTime), N'The Environmental Science Group received a prestigious grant to study local community educational tutoring.

In a major update from University FU, the environmental science group has officially received a prestigious grant to study local community educational tutoring. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Several regional publications have highlighted this effort as a model for other higher education networks.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. The university has committed additional funding to expand this program into subsequent academic semesters.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. This project is expected to revolutionize how students interact with modern tools and methodologies.', N'Campus Safety Dispatch', 5, 1, 1, 8, CAST(N'2026-04-22T18:21:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'131', N'The Artificial Intelligence Division established a strategic alliance with modern cyber-security defense frameworks', N'Indoor Sports: The Artificial Intelligence Division established a strategic alliance with modern cyber-security def', CAST(N'2024-12-06T09:22:00.000' AS DateTime), N'The Artificial Intelligence Division established a strategic alliance with modern cyber-security defense frameworks.

In a major update from University FU, the artificial intelligence division has officially established a strategic alliance with modern cyber-security defense frameworks. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Several regional publications have highlighted this effort as a model for other higher education networks.', N'Community Outreach Desk', 6, 1, 19, 8, CAST(N'2024-12-09T14:22:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'132', N'The Artificial Intelligence Division secured funding for projects related to modern cyber-security defense frameworks', N'Outdoor Sports: The Artificial Intelligence Division secured funding for projects related to modern cyber-security d', CAST(N'2026-01-05T10:50:00.000' AS DateTime), N'The Artificial Intelligence Division secured funding for projects related to modern cyber-security defense frameworks.

In a major update from University FU, the artificial intelligence division has officially secured funding for projects related to modern cyber-security defense frameworks. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Several regional publications have highlighted this effort as a model for other higher education networks.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. This project is expected to revolutionize how students interact with modern tools and methodologies.', N'Academic Office', 7, 1, 12, 20, CAST(N'2026-01-05T18:50:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'133', N'The Student Affairs Association unveiled plans to enhance high-performance athletic conditioning', N'Aquatic Sports: The Student Affairs Association unveiled plans to enhance high-performance athletic conditioning', CAST(N'2025-03-16T08:32:00.000' AS DateTime), N'The Student Affairs Association unveiled plans to enhance high-performance athletic conditioning.

In a major update from University FU, the student affairs association has officially unveiled plans to enhance high-performance athletic conditioning. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

This project is expected to revolutionize how students interact with modern tools and methodologies.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Several regional publications have highlighted this effort as a model for other higher education networks.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Preliminary results demonstrate an impressive improvement in key performance metrics across the board.', N'Athletics Office', 8, 0, 20, 20, CAST(N'2025-03-21T13:32:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'134', N'The Capstone Project Council partnered with local industries for campus emergency response coordination', N'Martial Arts & Combat Sports: The Capstone Project Council partnered with local industries for campus emergency response coordinat', CAST(N'2025-03-11T08:47:00.000' AS DateTime), N'The Capstone Project Council partnered with local industries for campus emergency response coordination.

In a major update from University FU, the capstone project council has officially partnered with local industries for campus emergency response coordination. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

The university has committed additional funding to expand this program into subsequent academic semesters.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. This project is expected to revolutionize how students interact with modern tools and methodologies.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.', N'Tech Division', 9, 1, 3, 9, CAST(N'2025-03-12T12:47:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'135', N'The Innovation and Incubation Lab hosted an international symposium on financial aid accessibility policies', N'E-Sports & Gaming: The Innovation and Incubation Lab hosted an international symposium on financial aid accessibility p', CAST(N'2025-06-18T09:54:00.000' AS DateTime), N'The Innovation and Incubation Lab hosted an international symposium on financial aid accessibility policies.

In a major update from University FU, the innovation and incubation lab has officially hosted an international symposium on financial aid accessibility policies. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. The university has committed additional funding to expand this program into subsequent academic semesters.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.', N'FU Communications', 10, 1, 10, 10, CAST(N'2025-06-20T12:54:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'136', N'The Business School Faculty celebrated the milestone achievement of campus emergency response coordination', N'Fitness & Wellness Programs: The Business School Faculty celebrated the milestone achievement of campus emergency response coordi', CAST(N'2024-08-16T10:32:00.000' AS DateTime), N'The Business School Faculty celebrated the milestone achievement of campus emergency response coordination.

In a major update from University FU, the business school faculty has officially celebrated the milestone achievement of campus emergency response coordination. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

This project is expected to revolutionize how students interact with modern tools and methodologies.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.', N'Research Center Desk', 11, 0, 13, 13, CAST(N'2024-08-18T13:32:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'137', N'The Career Development Center established a strategic alliance with innovative agricultural ecosystems', N'Intramural Sports: The Career Development Center established a strategic alliance with innovative agricultural ecosyste', CAST(N'2025-02-13T18:38:00.000' AS DateTime), N'The Career Development Center established a strategic alliance with innovative agricultural ecosystems.

In a major update from University FU, the career development center has officially established a strategic alliance with innovative agricultural ecosystems. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

The university has committed additional funding to expand this program into subsequent academic semesters.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. This project is expected to revolutionize how students interact with modern tools and methodologies.', N'Student Union', 12, 0, 3, 17, CAST(N'2025-02-15T19:38:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'138', N'The Student Housing Administration established a strategic alliance with sustainable urban architecture', N'Sports Tournaments & Championships: The Student Housing Administration established a strategic alliance with sustainable urban architect', CAST(N'2024-10-08T12:46:00.000' AS DateTime), N'The Student Housing Administration established a strategic alliance with sustainable urban architecture.

In a major update from University FU, the student housing administration has officially established a strategic alliance with sustainable urban architecture. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Several regional publications have highlighted this effort as a model for other higher education networks.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Preliminary results demonstrate an impressive improvement in key performance metrics across the board.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.', N'Research Center Desk', 13, 1, 4, 4, CAST(N'2024-10-11T17:46:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'139', N'The Business School Faculty organized a university-wide forum regarding high-performance athletic conditioning', N'Sports Facilities & Equipment: The Business School Faculty organized a university-wide forum regarding high-performance athletic co', CAST(N'2026-01-25T18:22:00.000' AS DateTime), N'The Business School Faculty organized a university-wide forum regarding high-performance athletic conditioning.

In a major update from University FU, the business school faculty has officially organized a university-wide forum regarding high-performance athletic conditioning. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Preliminary results demonstrate an impressive improvement in key performance metrics across the board.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. The university has committed additional funding to expand this program into subsequent academic semesters.', N'FU Communications', 14, 1, 14, 14, CAST(N'2026-01-30T02:22:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'140', N'The Environmental Science Group celebrated the milestone achievement of modern cyber-security defense frameworks', N'Athletic Scholarships & Recruitment: The Environmental Science Group celebrated the milestone achievement of modern cyber-security defens', CAST(N'2026-01-29T13:45:00.000' AS DateTime), N'The Environmental Science Group celebrated the milestone achievement of modern cyber-security defense frameworks.

In a major update from University FU, the environmental science group has officially celebrated the milestone achievement of modern cyber-security defense frameworks. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Preliminary results demonstrate an impressive improvement in key performance metrics across the board.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Several regional publications have highlighted this effort as a model for other higher education networks.', N'Academic Office', 15, 0, 18, 18, CAST(N'2026-01-31T22:45:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'141', N'The Library Services Committee received a prestigious grant to study advanced deep learning algorithms', N'Sports Medicine & Injury Prevention: The Library Services Committee received a prestigious grant to study advanced deep learning algorith', CAST(N'2025-04-19T08:49:00.000' AS DateTime), N'The Library Services Committee received a prestigious grant to study advanced deep learning algorithms.

In a major update from University FU, the library services committee has officially received a prestigious grant to study advanced deep learning algorithms. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

This project is expected to revolutionize how students interact with modern tools and methodologies.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.', N'Research Center Desk', 16, 1, 13, 13, CAST(N'2025-04-23T16:49:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'142', N'The Student Housing Administration established a strategic alliance with high-performance athletic conditioning', N'Outdoor Adventure & Hiking: The Student Housing Administration established a strategic alliance with high-performance athletic c', CAST(N'2026-01-18T14:15:00.000' AS DateTime), N'The Student Housing Administration established a strategic alliance with high-performance athletic conditioning.

In a major update from University FU, the student housing administration has officially established a strategic alliance with high-performance athletic conditioning. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. This project is expected to revolutionize how students interact with modern tools and methodologies.', N'Tech Division', 17, 1, 13, 13, CAST(N'2026-01-18T16:15:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'143', N'The Capstone Project Council launched a new initiative targeting cutting-edge technological advancements', N'Dance & Cheerleading: The Capstone Project Council launched a new initiative targeting cutting-edge technological advancem', CAST(N'2025-04-23T15:11:00.000' AS DateTime), N'The Capstone Project Council launched a new initiative targeting cutting-edge technological advancements.

In a major update from University FU, the capstone project council has officially launched a new initiative targeting cutting-edge technological advancements. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Several regional publications have highlighted this effort as a model for other higher education networks.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. The university has committed additional funding to expand this program into subsequent academic semesters.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.', N'Student Union', 18, 1, 8, 20, CAST(N'2025-04-25T21:11:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'144', N'The Performing Arts Ensemble unveiled plans to enhance interdisciplinary capstone engineering solutions', N'Health & Wellness: The Performing Arts Ensemble unveiled plans to enhance interdisciplinary capstone engineering soluti', CAST(N'2025-11-05T15:20:00.000' AS DateTime), N'The Performing Arts Ensemble unveiled plans to enhance interdisciplinary capstone engineering solutions.

In a major update from University FU, the performing arts ensemble has officially unveiled plans to enhance interdisciplinary capstone engineering solutions. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Several regional publications have highlighted this effort as a model for other higher education networks.', N'FU Communications', 19, 1, 20, 2, CAST(N'2025-11-11T01:20:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'145', N'The Student Housing Administration received a prestigious grant to study advanced deep learning algorithms', N'Career Services: The Student Housing Administration received a prestigious grant to study advanced deep learning algo', CAST(N'2024-07-21T09:11:00.000' AS DateTime), N'The Student Housing Administration received a prestigious grant to study advanced deep learning algorithms.

In a major update from University FU, the student housing administration has officially received a prestigious grant to study advanced deep learning algorithms. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. The university has committed additional funding to expand this program into subsequent academic semesters.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.', N'Tech Division', 20, 1, 5, 1, CAST(N'2024-07-24T16:11:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'146', N'The Alumni Relations Network organized a university-wide forum regarding interdisciplinary capstone engineering solutions', N'International Students: The Alumni Relations Network organized a university-wide forum regarding interdisciplinary capstone ', CAST(N'2026-03-08T15:25:00.000' AS DateTime), N'The Alumni Relations Network organized a university-wide forum regarding interdisciplinary capstone engineering solutions.

In a major update from University FU, the alumni relations network has officially organized a university-wide forum regarding interdisciplinary capstone engineering solutions. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

The university has committed additional funding to expand this program into subsequent academic semesters.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Several regional publications have highlighted this effort as a model for other higher education networks.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.', N'Academic Office', 21, 1, 16, 16, CAST(N'2026-03-11T20:25:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'147', N'The Career Development Center unveiled plans to enhance sports medicine and injury prevention', N'Technology & Innovation: The Career Development Center unveiled plans to enhance sports medicine and injury prevention', CAST(N'2025-11-06T15:35:00.000' AS DateTime), N'The Career Development Center unveiled plans to enhance sports medicine and injury prevention.

In a major update from University FU, the career development center has officially unveiled plans to enhance sports medicine and injury prevention. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Several regional publications have highlighted this effort as a model for other higher education networks.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.', N'Campus Safety Dispatch', 22, 1, 2, 2, CAST(N'2025-11-09T18:35:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'148', N'The Environmental Science Group introduced a revised curriculum focusing on sustainable urban architecture', N'Arts & Culture: The Environmental Science Group introduced a revised curriculum focusing on sustainable urban archit', CAST(N'2026-03-24T17:30:00.000' AS DateTime), N'The Environmental Science Group introduced a revised curriculum focusing on sustainable urban architecture.

In a major update from University FU, the environmental science group has officially introduced a revised curriculum focusing on sustainable urban architecture. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

This project is expected to revolutionize how students interact with modern tools and methodologies.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. The university has committed additional funding to expand this program into subsequent academic semesters.', N'Athletics Office', 23, 1, 13, 13, CAST(N'2026-03-29T02:30:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'149', N'The Campus Security Taskforce upgraded its facilities for financial aid accessibility policies', N'Research & Grants: The Campus Security Taskforce upgraded its facilities for financial aid accessibility policies', CAST(N'2025-03-01T11:06:00.000' AS DateTime), N'The Campus Security Taskforce upgraded its facilities for financial aid accessibility policies.

In a major update from University FU, the campus security taskforce has officially upgraded its facilities for financial aid accessibility policies. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Preliminary results demonstrate an impressive improvement in key performance metrics across the board.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Several regional publications have highlighted this effort as a model for other higher education networks.', N'Research Center Desk', 24, 1, 1, 15, CAST(N'2025-03-02T15:06:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'150', N'The Student Affairs Association organized a university-wide forum regarding advanced deep learning algorithms', N'Community Outreach: The Student Affairs Association organized a university-wide forum regarding advanced deep learning a', CAST(N'2025-05-09T16:25:00.000' AS DateTime), N'The Student Affairs Association organized a university-wide forum regarding advanced deep learning algorithms.

In a major update from University FU, the student affairs association has officially organized a university-wide forum regarding advanced deep learning algorithms. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

The university has committed additional funding to expand this program into subsequent academic semesters.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.', N'Community Outreach Desk', 25, 1, 11, 7, CAST(N'2025-05-10T20:25:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'151', N'The Student Housing Administration celebrated the milestone achievement of cutting-edge technological advancements', N'Facilities & Infrastructure: The Student Housing Administration celebrated the milestone achievement of cutting-edge technologica', CAST(N'2026-03-13T10:28:00.000' AS DateTime), N'The Student Housing Administration celebrated the milestone achievement of cutting-edge technological advancements.

In a major update from University FU, the student housing administration has officially celebrated the milestone achievement of cutting-edge technological advancements. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

This project is expected to revolutionize how students interact with modern tools and methodologies.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Preliminary results demonstrate an impressive improvement in key performance metrics across the board.', N'Alumni Association Quarterly', 26, 1, 18, 12, CAST(N'2026-03-16T19:28:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'152', N'The Library Services Committee established a strategic alliance with creative visual arts exhibitions', N'Environment & Sustainability: The Library Services Committee established a strategic alliance with creative visual arts exhibition', CAST(N'2026-03-06T12:13:00.000' AS DateTime), N'The Library Services Committee established a strategic alliance with creative visual arts exhibitions.

In a major update from University FU, the library services committee has officially established a strategic alliance with creative visual arts exhibitions. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Several regional publications have highlighted this effort as a model for other higher education networks.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. This project is expected to revolutionize how students interact with modern tools and methodologies.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.', N'Community Outreach Desk', 27, 1, 4, 4, CAST(N'2026-03-11T17:13:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'153', N'The Student Affairs Association partnered with local industries for cutting-edge technological advancements', N'Scholarships & Financial Aid: The Student Affairs Association partnered with local industries for cutting-edge technological advan', CAST(N'2026-04-01T14:49:00.000' AS DateTime), N'The Student Affairs Association partnered with local industries for cutting-edge technological advancements.

In a major update from University FU, the student affairs association has officially partnered with local industries for cutting-edge technological advancements. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

This project is expected to revolutionize how students interact with modern tools and methodologies.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. The university has committed additional funding to expand this program into subsequent academic semesters.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Preliminary results demonstrate an impressive improvement in key performance metrics across the board.', N'Alumni Association Quarterly', 28, 1, 14, 11, CAST(N'2026-04-02T16:49:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'154', N'The Innovation and Incubation Lab upgraded its facilities for financial aid accessibility policies', N'Athletics & Recreation: The Innovation and Incubation Lab upgraded its facilities for financial aid accessibility policies', CAST(N'2025-03-04T09:46:00.000' AS DateTime), N'The Innovation and Incubation Lab upgraded its facilities for financial aid accessibility policies.

In a major update from University FU, the innovation and incubation lab has officially upgraded its facilities for financial aid accessibility policies. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

The university has committed additional funding to expand this program into subsequent academic semesters.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. This project is expected to revolutionize how students interact with modern tools and methodologies.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.', N'Student Union', 29, 1, 13, 7, CAST(N'2025-03-08T17:46:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'155', N'The Artificial Intelligence Division upgraded its facilities for sports medicine and injury prevention', N'Administration & Governance: The Artificial Intelligence Division upgraded its facilities for sports medicine and injury preventi', CAST(N'2025-02-14T18:51:00.000' AS DateTime), N'The Artificial Intelligence Division upgraded its facilities for sports medicine and injury prevention.

In a major update from University FU, the artificial intelligence division has officially upgraded its facilities for sports medicine and injury prevention. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. This project is expected to revolutionize how students interact with modern tools and methodologies.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.', N'Research Center Desk', 30, 1, 20, 20, CAST(N'2025-02-15T22:51:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'156', N'The Campus Security Taskforce upgraded its facilities for cutting-edge technological advancements', N'Community Services: The Campus Security Taskforce upgraded its facilities for cutting-edge technological advancements', CAST(N'2024-12-27T14:01:00.000' AS DateTime), N'The Campus Security Taskforce upgraded its facilities for cutting-edge technological advancements.

In a major update from University FU, the campus security taskforce has officially upgraded its facilities for cutting-edge technological advancements. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

The university has committed additional funding to expand this program into subsequent academic semesters.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.', N'Student Union', 31, 1, 14, 18, CAST(N'2024-12-29T00:01:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'157', N'The Artificial Intelligence Division established a strategic alliance with sports medicine and injury prevention', N'Student Union Announcements: The Artificial Intelligence Division established a strategic alliance with sports medicine and injur', CAST(N'2025-10-15T08:46:00.000' AS DateTime), N'The Artificial Intelligence Division established a strategic alliance with sports medicine and injury prevention.

In a major update from University FU, the artificial intelligence division has officially established a strategic alliance with sports medicine and injury prevention. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.', N'Athletics Office', 32, 1, 18, 5, CAST(N'2025-10-19T11:46:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'158', N'The Varsity Esports Club partnered with local industries for post-graduation alumni career acceleration', N'Global Partnerships: The Varsity Esports Club partnered with local industries for post-graduation alumni career accelerat', CAST(N'2026-04-12T17:39:00.000' AS DateTime), N'The Varsity Esports Club partnered with local industries for post-graduation alumni career acceleration.

In a major update from University FU, the varsity esports club has officially partnered with local industries for post-graduation alumni career acceleration. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. This project is expected to revolutionize how students interact with modern tools and methodologies.', N'Academic Office', 33, 1, 16, 16, CAST(N'2026-04-17T18:39:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'159', N'The Library Services Committee launched a new initiative targeting cross-cultural student exchanges', N'Student Housing & Dorms: The Library Services Committee launched a new initiative targeting cross-cultural student exchanges', CAST(N'2025-09-25T15:34:00.000' AS DateTime), N'The Library Services Committee launched a new initiative targeting cross-cultural student exchanges.

In a major update from University FU, the library services committee has officially launched a new initiative targeting cross-cultural student exchanges. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

This project is expected to revolutionize how students interact with modern tools and methodologies.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. The university has committed additional funding to expand this program into subsequent academic semesters.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.', N'Student Union', 34, 1, 17, 5, CAST(N'2025-09-25T20:34:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'160', N'The Environmental Science Group organized a university-wide forum regarding modern cyber-security defense frameworks', N'Alumni Success Stories: The Environmental Science Group organized a university-wide forum regarding modern cyber-security de', CAST(N'2026-02-21T15:49:00.000' AS DateTime), N'The Environmental Science Group organized a university-wide forum regarding modern cyber-security defense frameworks.

In a major update from University FU, the environmental science group has officially organized a university-wide forum regarding modern cyber-security defense frameworks. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Several regional publications have highlighted this effort as a model for other higher education networks.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. This project is expected to revolutionize how students interact with modern tools and methodologies.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Preliminary results demonstrate an impressive improvement in key performance metrics across the board.', N'International Office News', 35, 1, 12, 3, CAST(N'2026-02-22T01:49:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'161', N'The Performing Arts Ensemble published groundbreaking findings on advanced deep learning algorithms', N'Academic news: The Performing Arts Ensemble published groundbreaking findings on advanced deep learning algorithms', CAST(N'2025-07-01T09:38:00.000' AS DateTime), N'The Performing Arts Ensemble published groundbreaking findings on advanced deep learning algorithms.

In a major update from University FU, the performing arts ensemble has officially published groundbreaking findings on advanced deep learning algorithms. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Several regional publications have highlighted this effort as a model for other higher education networks.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. The university has committed additional funding to expand this program into subsequent academic semesters.', N'International Office News', 1, 1, 3, 3, CAST(N'2025-07-05T18:38:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'162', N'The Health and Wellness Center celebrated the milestone achievement of advanced deep learning algorithms', N'Student Affairs: The Health and Wellness Center celebrated the milestone achievement of advanced deep learning algori', CAST(N'2026-05-24T11:21:00.000' AS DateTime), N'The Health and Wellness Center celebrated the milestone achievement of advanced deep learning algorithms.

In a major update from University FU, the health and wellness center has officially celebrated the milestone achievement of advanced deep learning algorithms. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

The university has committed additional funding to expand this program into subsequent academic semesters.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Several regional publications have highlighted this effort as a model for other higher education networks.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.', N'Community Outreach Desk', 2, 1, 18, 19, CAST(N'2026-05-26T14:21:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'163', N'The Global Partnerships Board organized a university-wide forum regarding high-performance athletic conditioning', N'Campus Safety: The Global Partnerships Board organized a university-wide forum regarding high-performance athletic ', CAST(N'2026-04-30T10:53:00.000' AS DateTime), N'The Global Partnerships Board organized a university-wide forum regarding high-performance athletic conditioning.

In a major update from University FU, the global partnerships board has officially organized a university-wide forum regarding high-performance athletic conditioning. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Preliminary results demonstrate an impressive improvement in key performance metrics across the board.', N'FU Communications', 3, 1, 4, 10, CAST(N'2026-05-04T20:53:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'164', N'The Capstone Project Council established a strategic alliance with student mental health advocacy', N'Alumni News: The Capstone Project Council established a strategic alliance with student mental health advocacy', CAST(N'2024-12-10T10:43:00.000' AS DateTime), N'The Capstone Project Council established a strategic alliance with student mental health advocacy.

In a major update from University FU, the capstone project council has officially established a strategic alliance with student mental health advocacy. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

This project is expected to revolutionize how students interact with modern tools and methodologies.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. The university has committed additional funding to expand this program into subsequent academic semesters.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Several regional publications have highlighted this effort as a model for other higher education networks.', N'Research Center Desk', 4, 1, 7, 7, CAST(N'2024-12-11T15:43:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'165', N'The Varsity Esports Club introduced a revised curriculum focusing on quantum computing research frontiers', N'Capstone Project News: The Varsity Esports Club introduced a revised curriculum focusing on quantum computing research fron', CAST(N'2026-03-26T09:45:00.000' AS DateTime), N'The Varsity Esports Club introduced a revised curriculum focusing on quantum computing research frontiers.

In a major update from University FU, the varsity esports club has officially introduced a revised curriculum focusing on quantum computing research frontiers. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.', N'Student Union', 5, 1, 15, 6, CAST(N'2026-03-27T16:45:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'166', N'The Business School Faculty upgraded its facilities for interdisciplinary capstone engineering solutions', N'Indoor Sports: The Business School Faculty upgraded its facilities for interdisciplinary capstone engineering solut', CAST(N'2025-10-24T17:31:00.000' AS DateTime), N'The Business School Faculty upgraded its facilities for interdisciplinary capstone engineering solutions.

In a major update from University FU, the business school faculty has officially upgraded its facilities for interdisciplinary capstone engineering solutions. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. This project is expected to revolutionize how students interact with modern tools and methodologies.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.', N'Athletics Office', 6, 1, 10, 10, CAST(N'2025-10-24T23:31:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'167', N'The Student Housing Administration published groundbreaking findings on sustainable urban architecture', N'Outdoor Sports: The Student Housing Administration published groundbreaking findings on sustainable urban architectu', CAST(N'2025-12-11T14:26:00.000' AS DateTime), N'The Student Housing Administration published groundbreaking findings on sustainable urban architecture.

In a major update from University FU, the student housing administration has officially published groundbreaking findings on sustainable urban architecture. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

This project is expected to revolutionize how students interact with modern tools and methodologies.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.', N'Tech Division', 7, 1, 13, 4, CAST(N'2025-12-16T22:26:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'168', N'The Innovation and Incubation Lab hosted an international symposium on advanced deep learning algorithms', N'Aquatic Sports: The Innovation and Incubation Lab hosted an international symposium on advanced deep learning algori', CAST(N'2025-05-12T14:10:00.000' AS DateTime), N'The Innovation and Incubation Lab hosted an international symposium on advanced deep learning algorithms.

In a major update from University FU, the innovation and incubation lab has officially hosted an international symposium on advanced deep learning algorithms. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

The university has committed additional funding to expand this program into subsequent academic semesters.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Preliminary results demonstrate an impressive improvement in key performance metrics across the board.', N'Student Union', 8, 1, 7, 7, CAST(N'2025-05-15T16:10:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'169', N'The Artificial Intelligence Division secured funding for projects related to sustainable urban architecture', N'Martial Arts & Combat Sports: The Artificial Intelligence Division secured funding for projects related to sustainable urban archi', CAST(N'2024-09-05T11:49:00.000' AS DateTime), N'The Artificial Intelligence Division secured funding for projects related to sustainable urban architecture.

In a major update from University FU, the artificial intelligence division has officially secured funding for projects related to sustainable urban architecture. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

This project is expected to revolutionize how students interact with modern tools and methodologies.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Preliminary results demonstrate an impressive improvement in key performance metrics across the board.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.', N'Alumni Association Quarterly', 9, 1, 12, 12, CAST(N'2024-09-06T15:49:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'170', N'The Performing Arts Ensemble established a strategic alliance with sports medicine and injury prevention', N'E-Sports & Gaming: The Performing Arts Ensemble established a strategic alliance with sports medicine and injury preven', CAST(N'2026-02-23T10:18:00.000' AS DateTime), N'The Performing Arts Ensemble established a strategic alliance with sports medicine and injury prevention.

In a major update from University FU, the performing arts ensemble has officially established a strategic alliance with sports medicine and injury prevention. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. The university has committed additional funding to expand this program into subsequent academic semesters.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. This project is expected to revolutionize how students interact with modern tools and methodologies.', N'Alumni Association Quarterly', 10, 1, 9, 9, CAST(N'2026-02-26T16:18:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'171', N'The Student Affairs Association unveiled plans to enhance student mental health advocacy', N'Fitness & Wellness Programs: The Student Affairs Association unveiled plans to enhance student mental health advocacy', CAST(N'2026-01-26T18:13:00.000' AS DateTime), N'The Student Affairs Association unveiled plans to enhance student mental health advocacy.

In a major update from University FU, the student affairs association has officially unveiled plans to enhance student mental health advocacy. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Preliminary results demonstrate an impressive improvement in key performance metrics across the board.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Several regional publications have highlighted this effort as a model for other higher education networks.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. This project is expected to revolutionize how students interact with modern tools and methodologies.', N'Tech Division', 11, 1, 1, 2, CAST(N'2026-01-29T19:13:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'172', N'The Capstone Project Council introduced a revised curriculum focusing on quantum computing research frontiers', N'Intramural Sports: The Capstone Project Council introduced a revised curriculum focusing on quantum computing research ', CAST(N'2026-04-23T10:43:00.000' AS DateTime), N'The Capstone Project Council introduced a revised curriculum focusing on quantum computing research frontiers.

In a major update from University FU, the capstone project council has officially introduced a revised curriculum focusing on quantum computing research frontiers. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Several regional publications have highlighted this effort as a model for other higher education networks.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. The university has committed additional funding to expand this program into subsequent academic semesters.', N'Community Outreach Desk', 12, 1, 16, 16, CAST(N'2026-04-27T14:43:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'173', N'The Campus Security Taskforce unveiled plans to enhance interdisciplinary capstone engineering solutions', N'Sports Tournaments & Championships: The Campus Security Taskforce unveiled plans to enhance interdisciplinary capstone engineering solut', CAST(N'2026-03-07T16:30:00.000' AS DateTime), N'The Campus Security Taskforce unveiled plans to enhance interdisciplinary capstone engineering solutions.

In a major update from University FU, the campus security taskforce has officially unveiled plans to enhance interdisciplinary capstone engineering solutions. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Several regional publications have highlighted this effort as a model for other higher education networks.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Preliminary results demonstrate an impressive improvement in key performance metrics across the board.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.', N'Alumni Association Quarterly', 13, 1, 9, 9, CAST(N'2026-03-08T22:30:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'174', N'The Health and Wellness Center received a prestigious grant to study financial aid accessibility policies', N'Sports Facilities & Equipment: The Health and Wellness Center received a prestigious grant to study financial aid accessibility pol', CAST(N'2026-02-20T15:14:00.000' AS DateTime), N'The Health and Wellness Center received a prestigious grant to study financial aid accessibility policies.

In a major update from University FU, the health and wellness center has officially received a prestigious grant to study financial aid accessibility policies. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Preliminary results demonstrate an impressive improvement in key performance metrics across the board.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.', N'Student Union', 14, 1, 6, 18, CAST(N'2026-02-20T17:14:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'175', N'The Student Affairs Association launched a new initiative targeting cutting-edge technological advancements', N'Athletic Scholarships & Recruitment: The Student Affairs Association launched a new initiative targeting cutting-edge technological advan', CAST(N'2026-01-02T17:21:00.000' AS DateTime), N'The Student Affairs Association launched a new initiative targeting cutting-edge technological advancements.

In a major update from University FU, the student affairs association has officially launched a new initiative targeting cutting-edge technological advancements. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Preliminary results demonstrate an impressive improvement in key performance metrics across the board.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. This project is expected to revolutionize how students interact with modern tools and methodologies.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Several regional publications have highlighted this effort as a model for other higher education networks.', N'Student Union', 15, 1, 8, 18, CAST(N'2026-01-06T19:21:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'176', N'The Business School Faculty received a prestigious grant to study high-performance athletic conditioning', N'Sports Medicine & Injury Prevention: The Business School Faculty received a prestigious grant to study high-performance athletic conditio', CAST(N'2025-03-25T15:47:00.000' AS DateTime), N'The Business School Faculty received a prestigious grant to study high-performance athletic conditioning.

In a major update from University FU, the business school faculty has officially received a prestigious grant to study high-performance athletic conditioning. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. This project is expected to revolutionize how students interact with modern tools and methodologies.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.', N'Student Union', 16, 1, 9, 9, CAST(N'2025-03-25T18:47:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'177', N'The Library Services Committee secured funding for projects related to sustainable urban architecture', N'Outdoor Adventure & Hiking: The Library Services Committee secured funding for projects related to sustainable urban architectur', CAST(N'2024-07-11T09:19:00.000' AS DateTime), N'The Library Services Committee secured funding for projects related to sustainable urban architecture.

In a major update from University FU, the library services committee has officially secured funding for projects related to sustainable urban architecture. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

This project is expected to revolutionize how students interact with modern tools and methodologies.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. The university has committed additional funding to expand this program into subsequent academic semesters.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.', N'FU Communications', 17, 1, 17, 17, CAST(N'2024-07-14T14:19:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'178', N'The Capstone Project Council secured funding for projects related to modern cyber-security defense frameworks', N'Dance & Cheerleading: The Capstone Project Council secured funding for projects related to modern cyber-security defense f', CAST(N'2024-07-18T12:28:00.000' AS DateTime), N'The Capstone Project Council secured funding for projects related to modern cyber-security defense frameworks.

In a major update from University FU, the capstone project council has officially secured funding for projects related to modern cyber-security defense frameworks. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Several regional publications have highlighted this effort as a model for other higher education networks.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. This project is expected to revolutionize how students interact with modern tools and methodologies.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Preliminary results demonstrate an impressive improvement in key performance metrics across the board.', N'International Office News', 18, 1, 16, 16, CAST(N'2024-07-20T16:28:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'179', N'The Library Services Committee published groundbreaking findings on modern cyber-security defense frameworks', N'Health & Wellness: The Library Services Committee published groundbreaking findings on modern cyber-security defense fr', CAST(N'2025-06-01T18:47:00.000' AS DateTime), N'The Library Services Committee published groundbreaking findings on modern cyber-security defense frameworks.

In a major update from University FU, the library services committee has officially published groundbreaking findings on modern cyber-security defense frameworks. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. The university has committed additional funding to expand this program into subsequent academic semesters.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.', N'Academic Office', 19, 1, 3, 2, CAST(N'2025-06-04T21:47:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'180', N'The Business School Faculty received a prestigious grant to study sustainable urban architecture', N'Career Services: The Business School Faculty received a prestigious grant to study sustainable urban architecture', CAST(N'2025-09-27T16:40:00.000' AS DateTime), N'The Business School Faculty received a prestigious grant to study sustainable urban architecture.

In a major update from University FU, the business school faculty has officially received a prestigious grant to study sustainable urban architecture. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

This project is expected to revolutionize how students interact with modern tools and methodologies.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Preliminary results demonstrate an impressive improvement in key performance metrics across the board.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.', N'Student Union', 20, 1, 9, 18, CAST(N'2025-09-30T22:40:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'181', N'The Artificial Intelligence Division celebrated the milestone achievement of cutting-edge technological advancements', N'International Students: The Artificial Intelligence Division celebrated the milestone achievement of cutting-edge technologi', CAST(N'2025-11-07T11:21:00.000' AS DateTime), N'The Artificial Intelligence Division celebrated the milestone achievement of cutting-edge technological advancements.

In a major update from University FU, the artificial intelligence division has officially celebrated the milestone achievement of cutting-edge technological advancements. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

This project is expected to revolutionize how students interact with modern tools and methodologies.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Several regional publications have highlighted this effort as a model for other higher education networks.', N'International Office News', 21, 0, 11, 11, CAST(N'2025-11-09T16:21:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'182', N'The Innovation and Incubation Lab received a prestigious grant to study cutting-edge technological advancements', N'Technology & Innovation: The Innovation and Incubation Lab received a prestigious grant to study cutting-edge technological a', CAST(N'2024-12-12T13:17:00.000' AS DateTime), N'The Innovation and Incubation Lab received a prestigious grant to study cutting-edge technological advancements.

In a major update from University FU, the innovation and incubation lab has officially received a prestigious grant to study cutting-edge technological advancements. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Several regional publications have highlighted this effort as a model for other higher education networks.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. This project is expected to revolutionize how students interact with modern tools and methodologies.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. The university has committed additional funding to expand this program into subsequent academic semesters.', N'Alumni Association Quarterly', 22, 1, 13, 19, CAST(N'2024-12-12T15:17:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'183', N'The Career Development Center introduced a revised curriculum focusing on cutting-edge technological advancements', N'Arts & Culture: The Career Development Center introduced a revised curriculum focusing on cutting-edge technological', CAST(N'2026-05-03T14:41:00.000' AS DateTime), N'The Career Development Center introduced a revised curriculum focusing on cutting-edge technological advancements.

In a major update from University FU, the career development center has officially introduced a revised curriculum focusing on cutting-edge technological advancements. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Preliminary results demonstrate an impressive improvement in key performance metrics across the board.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Several regional publications have highlighted this effort as a model for other higher education networks.', N'Student Union', 23, 1, 5, 2, CAST(N'2026-05-03T15:41:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'184', N'The Alumni Relations Network upgraded its facilities for sustainable urban architecture', N'Research & Grants: The Alumni Relations Network upgraded its facilities for sustainable urban architecture', CAST(N'2026-04-03T12:37:00.000' AS DateTime), N'The Alumni Relations Network upgraded its facilities for sustainable urban architecture.

In a major update from University FU, the alumni relations network has officially upgraded its facilities for sustainable urban architecture. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

The university has committed additional funding to expand this program into subsequent academic semesters.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.', N'Student Union', 24, 1, 9, 9, CAST(N'2026-04-08T18:37:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'185', N'The Career Development Center established a strategic alliance with modern cyber-security defense frameworks', N'Community Outreach: The Career Development Center established a strategic alliance with modern cyber-security defense fr', CAST(N'2026-03-15T13:24:00.000' AS DateTime), N'The Career Development Center established a strategic alliance with modern cyber-security defense frameworks.

In a major update from University FU, the career development center has officially established a strategic alliance with modern cyber-security defense frameworks. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Preliminary results demonstrate an impressive improvement in key performance metrics across the board.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Several regional publications have highlighted this effort as a model for other higher education networks.', N'International Office News', 25, 1, 10, 10, CAST(N'2026-03-18T17:24:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'186', N'The Campus Athletics Committee secured funding for projects related to innovative agricultural ecosystems', N'Facilities & Infrastructure: The Campus Athletics Committee secured funding for projects related to innovative agricultural ecosy', CAST(N'2025-03-01T14:06:00.000' AS DateTime), N'The Campus Athletics Committee secured funding for projects related to innovative agricultural ecosystems.

In a major update from University FU, the campus athletics committee has officially secured funding for projects related to innovative agricultural ecosystems. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. The university has committed additional funding to expand this program into subsequent academic semesters.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Several regional publications have highlighted this effort as a model for other higher education networks.', N'International Office News', 26, 1, 2, 17, CAST(N'2025-03-02T20:06:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'187', N'The Performing Arts Ensemble unveiled plans to enhance next-generation renewable energy grids', N'Environment & Sustainability: The Performing Arts Ensemble unveiled plans to enhance next-generation renewable energy grids', CAST(N'2024-10-28T10:10:00.000' AS DateTime), N'The Performing Arts Ensemble unveiled plans to enhance next-generation renewable energy grids.

In a major update from University FU, the performing arts ensemble has officially unveiled plans to enhance next-generation renewable energy grids. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

The university has committed additional funding to expand this program into subsequent academic semesters.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Preliminary results demonstrate an impressive improvement in key performance metrics across the board.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.', N'Athletics Office', 27, 1, 3, 3, CAST(N'2024-10-30T11:10:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'188', N'The Varsity Esports Club celebrated the milestone achievement of high-performance athletic conditioning', N'Scholarships & Financial Aid: The Varsity Esports Club celebrated the milestone achievement of high-performance athletic condition', CAST(N'2026-03-12T12:13:00.000' AS DateTime), N'The Varsity Esports Club celebrated the milestone achievement of high-performance athletic conditioning.

In a major update from University FU, the varsity esports club has officially celebrated the milestone achievement of high-performance athletic conditioning. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

The university has committed additional funding to expand this program into subsequent academic semesters.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Several regional publications have highlighted this effort as a model for other higher education networks.', N'FU Communications', 28, 1, 6, 14, CAST(N'2026-03-13T21:13:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'189', N'The Department of Software Engineering celebrated the milestone achievement of sports medicine and injury prevention', N'Athletics & Recreation: The Department of Software Engineering celebrated the milestone achievement of sports medicine and i', CAST(N'2025-06-23T15:07:00.000' AS DateTime), N'The Department of Software Engineering celebrated the milestone achievement of sports medicine and injury prevention.

In a major update from University FU, the department of software engineering has officially celebrated the milestone achievement of sports medicine and injury prevention. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Several regional publications have highlighted this effort as a model for other higher education networks.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. This project is expected to revolutionize how students interact with modern tools and methodologies.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.', N'Campus Safety Dispatch', 29, 1, 20, 14, CAST(N'2025-06-27T21:07:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'190', N'The Library Services Committee partnered with local industries for sustainable urban architecture', N'Administration & Governance: The Library Services Committee partnered with local industries for sustainable urban architecture', CAST(N'2025-02-11T16:40:00.000' AS DateTime), N'The Library Services Committee partnered with local industries for sustainable urban architecture.

In a major update from University FU, the library services committee has officially partnered with local industries for sustainable urban architecture. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Several regional publications have highlighted this effort as a model for other higher education networks.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. The university has committed additional funding to expand this program into subsequent academic semesters.', N'Student Union', 30, 1, 12, 15, CAST(N'2025-02-12T02:40:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'191', N'The Global Partnerships Board unveiled plans to enhance local community educational tutoring', N'Community Services: The Global Partnerships Board unveiled plans to enhance local community educational tutoring', CAST(N'2024-12-20T16:22:00.000' AS DateTime), N'The Global Partnerships Board unveiled plans to enhance local community educational tutoring.

In a major update from University FU, the global partnerships board has officially unveiled plans to enhance local community educational tutoring. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

This project is expected to revolutionize how students interact with modern tools and methodologies.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.', N'International Office News', 31, 1, 19, 19, CAST(N'2024-12-21T22:22:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'192', N'The Career Development Center published groundbreaking findings on high-performance athletic conditioning', N'Student Union Announcements: The Career Development Center published groundbreaking findings on high-performance athletic conditi', CAST(N'2026-01-13T17:55:00.000' AS DateTime), N'The Career Development Center published groundbreaking findings on high-performance athletic conditioning.

In a major update from University FU, the career development center has officially published groundbreaking findings on high-performance athletic conditioning. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Preliminary results demonstrate an impressive improvement in key performance metrics across the board.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. This project is expected to revolutionize how students interact with modern tools and methodologies.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Several regional publications have highlighted this effort as a model for other higher education networks.', N'FU Communications', 32, 1, 14, 12, CAST(N'2026-01-13T19:55:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'193', N'The Student Housing Administration established a strategic alliance with local community educational tutoring', N'Global Partnerships: The Student Housing Administration established a strategic alliance with local community educational', CAST(N'2025-07-18T12:52:00.000' AS DateTime), N'The Student Housing Administration established a strategic alliance with local community educational tutoring.

In a major update from University FU, the student housing administration has officially established a strategic alliance with local community educational tutoring. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. This project is expected to revolutionize how students interact with modern tools and methodologies.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Several regional publications have highlighted this effort as a model for other higher education networks.', N'Community Outreach Desk', 33, 0, 20, 16, CAST(N'2025-07-18T19:52:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'194', N'The Alumni Relations Network launched a new initiative targeting sports medicine and injury prevention', N'Student Housing & Dorms: The Alumni Relations Network launched a new initiative targeting sports medicine and injury preventi', CAST(N'2025-12-20T14:55:00.000' AS DateTime), N'The Alumni Relations Network launched a new initiative targeting sports medicine and injury prevention.

In a major update from University FU, the alumni relations network has officially launched a new initiative targeting sports medicine and injury prevention. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. The university has committed additional funding to expand this program into subsequent academic semesters.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.', N'FU Communications', 34, 1, 8, 19, CAST(N'2025-12-20T18:55:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'195', N'The Environmental Science Group published groundbreaking findings on interdisciplinary capstone engineering solutions', N'Alumni Success Stories: The Environmental Science Group published groundbreaking findings on interdisciplinary capstone engi', CAST(N'2025-01-03T14:19:00.000' AS DateTime), N'The Environmental Science Group published groundbreaking findings on interdisciplinary capstone engineering solutions.

In a major update from University FU, the environmental science group has officially published groundbreaking findings on interdisciplinary capstone engineering solutions. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

The university has committed additional funding to expand this program into subsequent academic semesters.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Several regional publications have highlighted this effort as a model for other higher education networks.', N'Academic Office', 35, 1, 14, 14, CAST(N'2025-01-08T23:19:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'196', N'The Environmental Science Group unveiled plans to enhance sports medicine and injury prevention', N'Academic news: The Environmental Science Group unveiled plans to enhance sports medicine and injury prevention', CAST(N'2025-03-21T13:08:00.000' AS DateTime), N'The Environmental Science Group unveiled plans to enhance sports medicine and injury prevention.

In a major update from University FU, the environmental science group has officially unveiled plans to enhance sports medicine and injury prevention. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Preliminary results demonstrate an impressive improvement in key performance metrics across the board.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Several regional publications have highlighted this effort as a model for other higher education networks.', N'Tech Division', 1, 1, 10, 10, CAST(N'2025-03-22T21:08:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'197', N'The Capstone Project Council partnered with local industries for financial aid accessibility policies', N'Student Affairs: The Capstone Project Council partnered with local industries for financial aid accessibility policie', CAST(N'2025-09-05T10:55:00.000' AS DateTime), N'The Capstone Project Council partnered with local industries for financial aid accessibility policies.

In a major update from University FU, the capstone project council has officially partnered with local industries for financial aid accessibility policies. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Preliminary results demonstrate an impressive improvement in key performance metrics across the board.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. This project is expected to revolutionize how students interact with modern tools and methodologies.', N'Research Center Desk', 2, 0, 7, 7, CAST(N'2025-09-10T17:55:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'198', N'The Artificial Intelligence Division organized a university-wide forum regarding high-performance athletic conditioning', N'Campus Safety: The Artificial Intelligence Division organized a university-wide forum regarding high-performance at', CAST(N'2025-05-29T09:42:00.000' AS DateTime), N'The Artificial Intelligence Division organized a university-wide forum regarding high-performance athletic conditioning.

In a major update from University FU, the artificial intelligence division has officially organized a university-wide forum regarding high-performance athletic conditioning. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.', N'Athletics Office', 3, 1, 16, 16, CAST(N'2025-05-29T11:42:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'199', N'The Campus Security Taskforce celebrated the milestone achievement of advanced deep learning algorithms', N'Alumni News: The Campus Security Taskforce celebrated the milestone achievement of advanced deep learning algorit', CAST(N'2025-08-25T16:13:00.000' AS DateTime), N'The Campus Security Taskforce celebrated the milestone achievement of advanced deep learning algorithms.

In a major update from University FU, the campus security taskforce has officially celebrated the milestone achievement of advanced deep learning algorithms. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. This project is expected to revolutionize how students interact with modern tools and methodologies.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.', N'International Office News', 4, 1, 19, 19, CAST(N'2025-08-25T22:13:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'200', N'The Environmental Science Group celebrated the milestone achievement of cutting-edge technological advancements', N'Capstone Project News: The Environmental Science Group celebrated the milestone achievement of cutting-edge technological a', CAST(N'2024-08-02T09:02:00.000' AS DateTime), N'The Environmental Science Group celebrated the milestone achievement of cutting-edge technological advancements.

In a major update from University FU, the environmental science group has officially celebrated the milestone achievement of cutting-edge technological advancements. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

This project is expected to revolutionize how students interact with modern tools and methodologies.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. The university has committed additional funding to expand this program into subsequent academic semesters.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.', N'Alumni Association Quarterly', 5, 1, 16, 14, CAST(N'2024-08-04T19:02:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'201', N'The Capstone Project Council organized a university-wide forum regarding creative visual arts exhibitions', N'Indoor Sports: The Capstone Project Council organized a university-wide forum regarding creative visual arts exhibi', CAST(N'2025-10-23T13:30:00.000' AS DateTime), N'The Capstone Project Council organized a university-wide forum regarding creative visual arts exhibitions.

In a major update from University FU, the capstone project council has officially organized a university-wide forum regarding creative visual arts exhibitions. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. This project is expected to revolutionize how students interact with modern tools and methodologies.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.', N'Community Outreach Desk', 6, 1, 7, 16, CAST(N'2025-10-25T23:30:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'202', N'The Environmental Science Group published groundbreaking findings on high-performance athletic conditioning', N'Outdoor Sports: The Environmental Science Group published groundbreaking findings on high-performance athletic condi', CAST(N'2026-03-28T08:18:00.000' AS DateTime), N'The Environmental Science Group published groundbreaking findings on high-performance athletic conditioning.

In a major update from University FU, the environmental science group has officially published groundbreaking findings on high-performance athletic conditioning. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

This project is expected to revolutionize how students interact with modern tools and methodologies.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. The university has committed additional funding to expand this program into subsequent academic semesters.', N'Alumni Association Quarterly', 7, 1, 11, 3, CAST(N'2026-03-29T12:18:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'203', N'The Performing Arts Ensemble partnered with local industries for sustainable urban architecture', N'Aquatic Sports: The Performing Arts Ensemble partnered with local industries for sustainable urban architecture', CAST(N'2025-05-26T14:33:00.000' AS DateTime), N'The Performing Arts Ensemble partnered with local industries for sustainable urban architecture.

In a major update from University FU, the performing arts ensemble has officially partnered with local industries for sustainable urban architecture. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Several regional publications have highlighted this effort as a model for other higher education networks.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.', N'Alumni Association Quarterly', 8, 0, 17, 2, CAST(N'2025-05-31T20:33:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'204', N'The Varsity Esports Club established a strategic alliance with advanced deep learning algorithms', N'Martial Arts & Combat Sports: The Varsity Esports Club established a strategic alliance with advanced deep learning algorithms', CAST(N'2025-11-04T09:02:00.000' AS DateTime), N'The Varsity Esports Club established a strategic alliance with advanced deep learning algorithms.

In a major update from University FU, the varsity esports club has officially established a strategic alliance with advanced deep learning algorithms. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. This project is expected to revolutionize how students interact with modern tools and methodologies.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. The university has committed additional funding to expand this program into subsequent academic semesters.', N'Campus Safety Dispatch', 9, 1, 13, 1, CAST(N'2025-11-06T12:02:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'205', N'The Health and Wellness Center introduced a revised curriculum focusing on next-generation renewable energy grids', N'E-Sports & Gaming: The Health and Wellness Center introduced a revised curriculum focusing on next-generation renewable', CAST(N'2025-02-04T14:03:00.000' AS DateTime), N'The Health and Wellness Center introduced a revised curriculum focusing on next-generation renewable energy grids.

In a major update from University FU, the health and wellness center has officially introduced a revised curriculum focusing on next-generation renewable energy grids. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. This project is expected to revolutionize how students interact with modern tools and methodologies.', N'FU Communications', 10, 1, 19, 19, CAST(N'2025-02-04T21:03:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'206', N'The Alumni Relations Network hosted an international symposium on interdisciplinary capstone engineering solutions', N'Fitness & Wellness Programs: The Alumni Relations Network hosted an international symposium on interdisciplinary capstone enginee', CAST(N'2026-04-12T18:44:00.000' AS DateTime), N'The Alumni Relations Network hosted an international symposium on interdisciplinary capstone engineering solutions.

In a major update from University FU, the alumni relations network has officially hosted an international symposium on interdisciplinary capstone engineering solutions. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Preliminary results demonstrate an impressive improvement in key performance metrics across the board.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. This project is expected to revolutionize how students interact with modern tools and methodologies.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. The university has committed additional funding to expand this program into subsequent academic semesters.', N'Research Center Desk', 11, 1, 2, 2, CAST(N'2026-04-12T20:44:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'207', N'The Department of Software Engineering hosted an international symposium on cutting-edge technological advancements', N'Intramural Sports: The Department of Software Engineering hosted an international symposium on cutting-edge technologic', CAST(N'2025-05-20T10:06:00.000' AS DateTime), N'The Department of Software Engineering hosted an international symposium on cutting-edge technological advancements.

In a major update from University FU, the department of software engineering has officially hosted an international symposium on cutting-edge technological advancements. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Several regional publications have highlighted this effort as a model for other higher education networks.', N'Athletics Office', 12, 0, 14, 20, CAST(N'2025-05-24T14:06:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'208', N'The Business School Faculty upgraded its facilities for advanced deep learning algorithms', N'Sports Tournaments & Championships: The Business School Faculty upgraded its facilities for advanced deep learning algorithms', CAST(N'2025-03-05T09:08:00.000' AS DateTime), N'The Business School Faculty upgraded its facilities for advanced deep learning algorithms.

In a major update from University FU, the business school faculty has officially upgraded its facilities for advanced deep learning algorithms. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

The university has committed additional funding to expand this program into subsequent academic semesters.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.', N'Campus Safety Dispatch', 13, 1, 5, 8, CAST(N'2025-03-10T14:08:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'209', N'The Campus Security Taskforce organized a university-wide forum regarding financial aid accessibility policies', N'Sports Facilities & Equipment: The Campus Security Taskforce organized a university-wide forum regarding financial aid accessibilit', CAST(N'2026-04-04T10:40:00.000' AS DateTime), N'The Campus Security Taskforce organized a university-wide forum regarding financial aid accessibility policies.

In a major update from University FU, the campus security taskforce has officially organized a university-wide forum regarding financial aid accessibility policies. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Several regional publications have highlighted this effort as a model for other higher education networks.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. The university has committed additional funding to expand this program into subsequent academic semesters.', N'Community Outreach Desk', 14, 1, 2, 12, CAST(N'2026-04-04T20:40:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'210', N'The Alumni Relations Network unveiled plans to enhance quantum computing research frontiers', N'Athletic Scholarships & Recruitment: The Alumni Relations Network unveiled plans to enhance quantum computing research frontiers', CAST(N'2025-01-16T09:16:00.000' AS DateTime), N'The Alumni Relations Network unveiled plans to enhance quantum computing research frontiers.

In a major update from University FU, the alumni relations network has officially unveiled plans to enhance quantum computing research frontiers. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Several regional publications have highlighted this effort as a model for other higher education networks.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. This project is expected to revolutionize how students interact with modern tools and methodologies.', N'Alumni Association Quarterly', 15, 1, 20, 1, CAST(N'2025-01-18T10:16:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'211', N'The Alumni Relations Network established a strategic alliance with creative visual arts exhibitions', N'Sports Medicine & Injury Prevention: The Alumni Relations Network established a strategic alliance with creative visual arts exhibitions', CAST(N'2025-08-22T12:30:00.000' AS DateTime), N'The Alumni Relations Network established a strategic alliance with creative visual arts exhibitions.

In a major update from University FU, the alumni relations network has officially established a strategic alliance with creative visual arts exhibitions. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Preliminary results demonstrate an impressive improvement in key performance metrics across the board.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.', N'Research Center Desk', 16, 0, 13, 13, CAST(N'2025-08-26T22:30:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'212', N'The Varsity Esports Club launched a new initiative targeting modern cyber-security defense frameworks', N'Outdoor Adventure & Hiking: The Varsity Esports Club launched a new initiative targeting modern cyber-security defense framework', CAST(N'2025-09-26T10:27:00.000' AS DateTime), N'The Varsity Esports Club launched a new initiative targeting modern cyber-security defense frameworks.

In a major update from University FU, the varsity esports club has officially launched a new initiative targeting modern cyber-security defense frameworks. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

The university has committed additional funding to expand this program into subsequent academic semesters.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. This project is expected to revolutionize how students interact with modern tools and methodologies.', N'Alumni Association Quarterly', 17, 1, 10, 14, CAST(N'2025-09-28T17:27:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'213', N'The Department of Software Engineering celebrated the milestone achievement of creative visual arts exhibitions', N'Dance & Cheerleading: The Department of Software Engineering celebrated the milestone achievement of creative visual arts ', CAST(N'2025-08-29T11:34:00.000' AS DateTime), N'The Department of Software Engineering celebrated the milestone achievement of creative visual arts exhibitions.

In a major update from University FU, the department of software engineering has officially celebrated the milestone achievement of creative visual arts exhibitions. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Preliminary results demonstrate an impressive improvement in key performance metrics across the board.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Several regional publications have highlighted this effort as a model for other higher education networks.', N'Campus Safety Dispatch', 18, 1, 3, 15, CAST(N'2025-09-03T20:34:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'214', N'The Campus Athletics Committee celebrated the milestone achievement of modern cyber-security defense frameworks', N'Health & Wellness: The Campus Athletics Committee celebrated the milestone achievement of modern cyber-security defense', CAST(N'2025-11-16T13:06:00.000' AS DateTime), N'The Campus Athletics Committee celebrated the milestone achievement of modern cyber-security defense frameworks.

In a major update from University FU, the campus athletics committee has officially celebrated the milestone achievement of modern cyber-security defense frameworks. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. This project is expected to revolutionize how students interact with modern tools and methodologies.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.', N'FU Communications', 19, 1, 11, 11, CAST(N'2025-11-19T17:06:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'215', N'The Innovation and Incubation Lab introduced a revised curriculum focusing on innovative agricultural ecosystems', N'Career Services: The Innovation and Incubation Lab introduced a revised curriculum focusing on innovative agricultura', CAST(N'2025-05-21T11:16:00.000' AS DateTime), N'The Innovation and Incubation Lab introduced a revised curriculum focusing on innovative agricultural ecosystems.

In a major update from University FU, the innovation and incubation lab has officially introduced a revised curriculum focusing on innovative agricultural ecosystems. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

The university has committed additional funding to expand this program into subsequent academic semesters.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.', N'FU Communications', 20, 1, 9, 9, CAST(N'2025-05-23T13:16:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'216', N'The Library Services Committee published groundbreaking findings on cutting-edge technological advancements', N'International Students: The Library Services Committee published groundbreaking findings on cutting-edge technological advan', CAST(N'2025-12-08T10:55:00.000' AS DateTime), N'The Library Services Committee published groundbreaking findings on cutting-edge technological advancements.

In a major update from University FU, the library services committee has officially published groundbreaking findings on cutting-edge technological advancements. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. This project is expected to revolutionize how students interact with modern tools and methodologies.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.', N'Community Outreach Desk', 21, 0, 9, 12, CAST(N'2025-12-10T15:55:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'217', N'The Department of Software Engineering established a strategic alliance with cross-cultural student exchanges', N'Technology & Innovation: The Department of Software Engineering established a strategic alliance with cross-cultural student ', CAST(N'2025-04-20T08:30:00.000' AS DateTime), N'The Department of Software Engineering established a strategic alliance with cross-cultural student exchanges.

In a major update from University FU, the department of software engineering has officially established a strategic alliance with cross-cultural student exchanges. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Several regional publications have highlighted this effort as a model for other higher education networks.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.', N'Academic Office', 22, 1, 18, 4, CAST(N'2025-04-20T14:30:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'218', N'The Artificial Intelligence Division celebrated the milestone achievement of advanced deep learning algorithms', N'Arts & Culture: The Artificial Intelligence Division celebrated the milestone achievement of advanced deep learning ', CAST(N'2026-04-26T17:48:00.000' AS DateTime), N'The Artificial Intelligence Division celebrated the milestone achievement of advanced deep learning algorithms.

In a major update from University FU, the artificial intelligence division has officially celebrated the milestone achievement of advanced deep learning algorithms. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Several regional publications have highlighted this effort as a model for other higher education networks.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Preliminary results demonstrate an impressive improvement in key performance metrics across the board.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.', N'Research Center Desk', 23, 1, 7, 7, CAST(N'2026-04-27T22:48:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'219', N'The Environmental Science Group secured funding for projects related to cross-cultural student exchanges', N'Research & Grants: The Environmental Science Group secured funding for projects related to cross-cultural student excha', CAST(N'2025-03-01T13:28:00.000' AS DateTime), N'The Environmental Science Group secured funding for projects related to cross-cultural student exchanges.

In a major update from University FU, the environmental science group has officially secured funding for projects related to cross-cultural student exchanges. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Preliminary results demonstrate an impressive improvement in key performance metrics across the board.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. This project is expected to revolutionize how students interact with modern tools and methodologies.', N'Academic Office', 24, 0, 6, 6, CAST(N'2025-03-01T21:28:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'220', N'The Health and Wellness Center upgraded its facilities for local community educational tutoring', N'Community Outreach: The Health and Wellness Center upgraded its facilities for local community educational tutoring', CAST(N'2025-05-22T12:48:00.000' AS DateTime), N'The Health and Wellness Center upgraded its facilities for local community educational tutoring.

In a major update from University FU, the health and wellness center has officially upgraded its facilities for local community educational tutoring. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

This project is expected to revolutionize how students interact with modern tools and methodologies.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. The university has committed additional funding to expand this program into subsequent academic semesters.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Preliminary results demonstrate an impressive improvement in key performance metrics across the board.', N'Academic Office', 25, 1, 18, 7, CAST(N'2025-05-27T14:48:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'221', N'The Innovation and Incubation Lab launched a new initiative targeting creative visual arts exhibitions', N'Facilities & Infrastructure: The Innovation and Incubation Lab launched a new initiative targeting creative visual arts exhibitio', CAST(N'2025-06-12T17:25:00.000' AS DateTime), N'The Innovation and Incubation Lab launched a new initiative targeting creative visual arts exhibitions.

In a major update from University FU, the innovation and incubation lab has officially launched a new initiative targeting creative visual arts exhibitions. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Several regional publications have highlighted this effort as a model for other higher education networks.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. The university has committed additional funding to expand this program into subsequent academic semesters.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.', N'Student Union', 26, 1, 16, 16, CAST(N'2025-06-12T18:25:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'222', N'The Career Development Center introduced a revised curriculum focusing on student mental health advocacy', N'Environment & Sustainability: The Career Development Center introduced a revised curriculum focusing on student mental health advo', CAST(N'2024-08-12T17:24:00.000' AS DateTime), N'The Career Development Center introduced a revised curriculum focusing on student mental health advocacy.

In a major update from University FU, the career development center has officially introduced a revised curriculum focusing on student mental health advocacy. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Several regional publications have highlighted this effort as a model for other higher education networks.', N'Research Center Desk', 27, 1, 5, 4, CAST(N'2024-08-16T00:24:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'223', N'The Business School Faculty partnered with local industries for sustainable urban architecture', N'Scholarships & Financial Aid: The Business School Faculty partnered with local industries for sustainable urban architecture', CAST(N'2024-08-01T08:48:00.000' AS DateTime), N'The Business School Faculty partnered with local industries for sustainable urban architecture.

In a major update from University FU, the business school faculty has officially partnered with local industries for sustainable urban architecture. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Several regional publications have highlighted this effort as a model for other higher education networks.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. This project is expected to revolutionize how students interact with modern tools and methodologies.', N'Student Union', 28, 1, 15, 15, CAST(N'2024-08-05T16:48:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'224', N'The Library Services Committee published groundbreaking findings on sports medicine and injury prevention', N'Athletics & Recreation: The Library Services Committee published groundbreaking findings on sports medicine and injury preve', CAST(N'2024-12-11T12:50:00.000' AS DateTime), N'The Library Services Committee published groundbreaking findings on sports medicine and injury prevention.

In a major update from University FU, the library services committee has officially published groundbreaking findings on sports medicine and injury prevention. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

This project is expected to revolutionize how students interact with modern tools and methodologies.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. The university has committed additional funding to expand this program into subsequent academic semesters.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Preliminary results demonstrate an impressive improvement in key performance metrics across the board.', N'Tech Division', 29, 1, 9, 12, CAST(N'2024-12-15T21:50:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'225', N'The Career Development Center introduced a revised curriculum focusing on financial aid accessibility policies', N'Administration & Governance: The Career Development Center introduced a revised curriculum focusing on financial aid accessibilit', CAST(N'2026-02-22T09:52:00.000' AS DateTime), N'The Career Development Center introduced a revised curriculum focusing on financial aid accessibility policies.

In a major update from University FU, the career development center has officially introduced a revised curriculum focusing on financial aid accessibility policies. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Several regional publications have highlighted this effort as a model for other higher education networks.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Preliminary results demonstrate an impressive improvement in key performance metrics across the board.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.', N'Tech Division', 30, 1, 6, 6, CAST(N'2026-02-22T13:52:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'226', N'The Artificial Intelligence Division upgraded its facilities for financial aid accessibility policies', N'Community Services: The Artificial Intelligence Division upgraded its facilities for financial aid accessibility policie', CAST(N'2024-07-03T16:27:00.000' AS DateTime), N'The Artificial Intelligence Division upgraded its facilities for financial aid accessibility policies.

In a major update from University FU, the artificial intelligence division has officially upgraded its facilities for financial aid accessibility policies. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Preliminary results demonstrate an impressive improvement in key performance metrics across the board.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. The university has committed additional funding to expand this program into subsequent academic semesters.', N'Tech Division', 31, 1, 19, 19, CAST(N'2024-07-05T20:27:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'227', N'The Global Partnerships Board launched a new initiative targeting innovative agricultural ecosystems', N'Student Union Announcements: The Global Partnerships Board launched a new initiative targeting innovative agricultural ecosystems', CAST(N'2025-02-20T15:30:00.000' AS DateTime), N'The Global Partnerships Board launched a new initiative targeting innovative agricultural ecosystems.

In a major update from University FU, the global partnerships board has officially launched a new initiative targeting innovative agricultural ecosystems. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. This project is expected to revolutionize how students interact with modern tools and methodologies.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Industry sponsors have pledged ongoing support, bridging the gap between theoretical training and industry requirements.', N'Research Center Desk', 32, 1, 7, 18, CAST(N'2025-02-23T19:30:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'228', N'The Campus Security Taskforce established a strategic alliance with sustainable urban architecture', N'Global Partnerships: The Campus Security Taskforce established a strategic alliance with sustainable urban architecture', CAST(N'2026-03-28T14:25:00.000' AS DateTime), N'The Campus Security Taskforce established a strategic alliance with sustainable urban architecture.

In a major update from University FU, the campus security taskforce has officially established a strategic alliance with sustainable urban architecture. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Several regional publications have highlighted this effort as a model for other higher education networks.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. The university has committed additional funding to expand this program into subsequent academic semesters.', N'Campus Safety Dispatch', 33, 1, 12, 18, CAST(N'2026-03-30T15:25:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'229', N'The Campus Athletics Committee celebrated the milestone achievement of interdisciplinary capstone engineering solutions', N'Student Housing & Dorms: The Campus Athletics Committee celebrated the milestone achievement of interdisciplinary capstone en', CAST(N'2025-01-12T08:15:00.000' AS DateTime), N'The Campus Athletics Committee celebrated the milestone achievement of interdisciplinary capstone engineering solutions.

In a major update from University FU, the campus athletics committee has officially celebrated the milestone achievement of interdisciplinary capstone engineering solutions. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

This achievement strengthens our institution''s position as a regional leader in creative and scientific endeavors.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. The university has committed additional funding to expand this program into subsequent academic semesters.', N'International Office News', 34, 1, 10, 19, CAST(N'2025-01-16T09:15:00.000' AS DateTime))
GO
INSERT [dbo].[NewsArticle] ([NewsArticleID], [NewsTitle], [Headline], [CreatedDate], [NewsContent], [NewsSource], [CategoryID], [NewsStatus], [CreatedByID], [UpdatedByID], [ModifiedDate]) VALUES (N'230', N'The Campus Athletics Committee organized a university-wide forum regarding modern cyber-security defense frameworks', N'Alumni Success Stories: The Campus Athletics Committee organized a university-wide forum regarding modern cyber-security def', CAST(N'2026-04-17T18:26:00.000' AS DateTime), N'The Campus Athletics Committee organized a university-wide forum regarding modern cyber-security defense frameworks.

In a major update from University FU, the campus athletics committee has officially organized a university-wide forum regarding modern cyber-security defense frameworks. This initiative aligns with the university''s broader mission of fostering excellence and driving real-world impacts across various fields.

Several regional publications have highlighted this effort as a model for other higher education networks.

Key collaborators and faculty leads have spent several months designing the framework to ensure all participants receive optimal support. The university has committed additional funding to expand this program into subsequent academic semesters.

Furthermore, external advisors and industry partners are actively involved to extend the scope beyond our main campus. Faculty members and student volunteers have expressed overwhelming optimism about the long-term impact.', N'Campus Safety Dispatch', 35, 1, 7, 18, CAST(N'2026-04-23T02:26:00.000' AS DateTime))
GO

-- =====================================================
-- INSERT NEWS TAGS
-- =====================================================

INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'1', 5)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'1', 7)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'1', 9)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'2', 5)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'2', 7)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'2', 8)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'2', 9)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'3', 1)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'3', 8)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'3', 9)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'4', 1)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'4', 4)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'4', 8)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'4', 9)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'5', 2)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'5', 3)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'5', 4)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'5', 6)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'6', 2)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'6', 5)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'6', 9)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'7', 11)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'7', 10)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'8', 12)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'8', 1)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'8', 8)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'9', 13)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'9', 1)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'9', 9)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'10', 14)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'10', 4)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'10', 1)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'10', 8)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'11', 15)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'11', 10)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'11', 8)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'12', 16)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'12', 3)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'12', 18)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'12', 4)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'13', 17)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'13', 10)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'13', 1)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'14', 18)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'14', 9)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'14', 4)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'15', 19)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'15', 1)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'15', 10)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'16', 10)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'16', 8)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'16', 5)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'17', 9)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'17', 11)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'18', 1)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'18', 3)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'18', 9)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'19', 18)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'19', 10)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'19', 11)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'20', 14)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'20', 4)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'20', 3)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'20', 1)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'21', 18)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'21', 13)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'22', 10)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'22', 5)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'22', 15)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'23', 8)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'24', 5)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'24', 14)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'24', 26)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'25', 16)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'25', 6)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'25', 15)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'25', 30)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'26', 3)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'26', 16)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'26', 12)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'27', 14)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'27', 4)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'27', 10)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'28', 21)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'28', 10)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'28', 25)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'28', 8)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'29', 29)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'29', 25)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'29', 6)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'30', 11)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'30', 29)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'31', 1)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'31', 22)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'31', 13)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'31', 19)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'32', 4)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'32', 21)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'32', 30)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'33', 30)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'33', 6)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'33', 8)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'33', 14)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'34', 20)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'34', 27)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'34', 7)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'34', 2)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'35', 18)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'35', 13)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'35', 17)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'36', 27)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'36', 22)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'37', 21)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'37', 17)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'37', 7)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'38', 22)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'39', 27)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'39', 4)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'39', 17)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'39', 22)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'40', 3)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'40', 24)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'40', 28)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'41', 3)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'41', 10)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'41', 22)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'42', 23)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'42', 11)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'43', 18)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'43', 25)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'44', 23)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'44', 25)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'45', 3)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'45', 8)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'46', 9)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'46', 27)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'46', 23)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'46', 30)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'47', 5)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'47', 29)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'47', 13)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'48', 4)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'48', 9)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'48', 24)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'49', 30)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'50', 28)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'50', 3)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'50', 14)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'50', 24)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'51', 13)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'51', 17)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'52', 24)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'52', 3)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'52', 28)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'52', 5)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'53', 12)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'53', 30)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'53', 27)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'54', 13)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'54', 21)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'55', 30)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'55', 25)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'56', 16)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'56', 22)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'56', 6)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'57', 7)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'58', 13)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'59', 13)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'59', 18)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'60', 29)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'61', 3)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'62', 12)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'62', 7)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'62', 14)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'63', 8)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'63', 2)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'63', 12)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'63', 6)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'64', 27)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'65', 17)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'65', 28)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'66', 13)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'66', 21)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'66', 26)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'67', 18)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'67', 23)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'67', 11)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'67', 5)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'68', 30)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'68', 28)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'69', 16)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'69', 11)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'70', 8)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'71', 20)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'71', 4)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'72', 16)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'73', 8)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'74', 4)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'74', 3)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'74', 8)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'74', 12)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'75', 18)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'75', 2)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'75', 21)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'75', 4)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'76', 16)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'76', 11)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'76', 3)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'76', 14)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'77', 3)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'78', 15)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'78', 5)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'79', 2)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'79', 21)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'79', 4)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'79', 22)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'80', 6)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'81', 20)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'81', 24)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'81', 11)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'82', 17)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'82', 10)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'82', 3)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'82', 24)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'83', 16)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'83', 29)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'83', 30)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'83', 3)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'84', 22)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'85', 23)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'85', 3)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'86', 7)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'86', 12)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'86', 5)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'87', 14)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'88', 30)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'88', 18)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'88', 22)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'89', 11)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'90', 24)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'90', 14)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'90', 28)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'90', 3)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'91', 30)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'91', 23)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'92', 23)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'92', 20)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'92', 14)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'92', 10)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'93', 17)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'93', 27)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'93', 1)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'93', 28)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'94', 12)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'94', 11)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'94', 4)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'94', 25)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'95', 10)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'95', 21)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'95', 19)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'95', 20)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'96', 2)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'97', 30)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'97', 26)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'97', 25)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'97', 29)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'98', 19)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'98', 1)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'98', 23)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'99', 3)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'100', 14)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'100', 29)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'100', 20)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'101', 25)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'101', 12)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'101', 16)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'101', 24)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'102', 27)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'102', 10)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'102', 21)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'103', 30)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'104', 27)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'105', 5)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'105', 24)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'105', 26)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'106', 12)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'106', 20)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'106', 2)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'107', 27)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'107', 24)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'107', 9)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'107', 14)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'108', 13)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'108', 29)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'108', 18)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'108', 21)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'109', 8)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'109', 6)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'110', 20)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'111', 8)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'111', 24)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'112', 20)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'113', 7)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'114', 24)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'114', 29)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'114', 5)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'114', 6)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'115', 24)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'115', 30)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'116', 10)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'116', 30)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'116', 24)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'116', 16)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'117', 15)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'118', 17)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'118', 25)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'119', 23)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'119', 15)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'119', 12)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'120', 10)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'121', 29)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'121', 16)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'121', 26)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'122', 21)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'122', 10)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'123', 28)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'123', 21)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'123', 19)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'123', 9)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'124', 14)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'124', 8)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'125', 2)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'125', 20)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'126', 30)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'126', 18)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'126', 23)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'127', 5)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'127', 25)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'127', 9)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'128', 4)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'128', 6)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'128', 27)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'128', 20)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'129', 7)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'129', 13)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'130', 7)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'130', 22)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'130', 23)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'131', 30)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'131', 18)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'132', 29)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'132', 14)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'133', 25)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'134', 8)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'134', 3)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'135', 6)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'135', 9)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'135', 18)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'135', 14)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'136', 16)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'137', 27)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'138', 26)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'138', 30)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'139', 10)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'139', 28)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'139', 24)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'139', 15)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'140', 8)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'140', 10)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'140', 4)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'140', 2)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'141', 4)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'141', 26)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'141', 6)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'142', 1)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'142', 24)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'143', 19)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'143', 22)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'144', 14)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'145', 22)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'145', 6)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'146', 26)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'147', 25)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'147', 29)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'147', 22)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'148', 25)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'149', 2)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'149', 4)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'150', 10)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'150', 15)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'151', 24)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'151', 3)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'151', 28)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'152', 14)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'152', 21)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'152', 2)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'152', 8)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'153', 6)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'154', 17)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'154', 7)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'154', 18)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'154', 12)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'155', 28)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'155', 10)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'156', 17)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'156', 10)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'156', 7)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'157', 7)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'157', 9)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'158', 28)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'158', 12)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'158', 3)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'158', 19)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'159', 12)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'159', 22)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'160', 5)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'161', 12)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'161', 26)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'161', 2)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'162', 26)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'162', 1)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'163', 24)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'163', 2)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'164', 9)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'164', 16)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'164', 13)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'165', 16)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'166', 8)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'167', 6)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'168', 26)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'168', 5)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'168', 29)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'169', 21)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'169', 27)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'169', 3)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'170', 19)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'170', 24)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'170', 9)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'171', 22)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'172', 1)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'172', 9)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'172', 25)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'172', 11)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'173', 2)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'173', 8)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'173', 14)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'174', 13)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'174', 21)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'174', 6)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'175', 9)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'176', 15)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'176', 5)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'176', 28)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'176', 13)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'177', 6)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'177', 13)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'177', 4)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'177', 23)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'178', 3)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'178', 1)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'178', 12)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'178', 20)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'179', 25)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'179', 2)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'179', 26)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'179', 12)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'180', 9)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'180', 30)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'180', 25)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'180', 4)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'181', 5)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'181', 1)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'181', 20)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'181', 3)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'182', 18)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'182', 13)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'182', 28)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'182', 12)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'183', 28)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'183', 17)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'183', 9)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'183', 4)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'184', 10)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'184', 21)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'184', 3)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'185', 22)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'186', 13)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'186', 19)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'186', 5)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'187', 10)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'187', 18)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'187', 24)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'188', 14)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'188', 22)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'188', 2)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'189', 18)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'189', 24)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'189', 27)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'189', 11)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'190', 8)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'190', 13)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'190', 24)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'191', 25)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'191', 1)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'191', 11)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'192', 2)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'192', 12)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'192', 13)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'192', 4)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'193', 10)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'193', 15)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'193', 11)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'194', 27)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'194', 19)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'195', 13)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'195', 9)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'195', 17)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'195', 24)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'196', 30)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'196', 18)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'197', 27)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'197', 4)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'198', 13)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'198', 8)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'198', 15)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'198', 30)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'199', 4)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'199', 16)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'199', 23)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'200', 8)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'200', 26)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'200', 18)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'200', 3)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'201', 11)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'201', 19)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'201', 7)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'202', 10)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'202', 16)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'202', 19)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'202', 12)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'203', 11)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'203', 25)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'203', 2)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'204', 12)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'204', 25)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'204', 8)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'205', 20)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'206', 2)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'206', 6)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'207', 28)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'207', 30)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'207', 21)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'208', 17)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'208', 22)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'209', 21)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'210', 18)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'211', 1)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'211', 25)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'211', 6)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'211', 3)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'212', 24)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'212', 3)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'213', 29)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'214', 5)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'215', 16)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'216', 20)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'216', 22)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'217', 23)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'218', 9)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'218', 11)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'219', 23)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'219', 13)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'220', 4)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'220', 5)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'220', 14)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'220', 18)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'221', 30)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'221', 28)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'222', 25)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'222', 6)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'223', 2)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'224', 22)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'224', 5)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'224', 28)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'225', 26)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'225', 13)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'225', 9)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'226', 24)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'227', 18)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'227', 1)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'227', 30)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'228', 9)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'228', 15)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'229', 13)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'229', 23)
GO
INSERT [dbo].[NewsTag] ([NewsArticleID], [TagID]) VALUES (N'230', 8)
GO

-- =====================================================
-- ADD FOREIGN KEY CONSTRAINTS
-- =====================================================
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_Category_Category] FOREIGN KEY([ParentCategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_Category_Category]
GO

ALTER TABLE [dbo].[NewsArticle]  WITH CHECK ADD  CONSTRAINT [FK_NewsArticle_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NewsArticle] CHECK CONSTRAINT [FK_NewsArticle_Category]
GO

ALTER TABLE [dbo].[NewsArticle]  WITH CHECK ADD  CONSTRAINT [FK_NewsArticle_SystemAccount] FOREIGN KEY([CreatedByID])
REFERENCES [dbo].[SystemAccount] ([AccountID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NewsArticle] CHECK CONSTRAINT [FK_NewsArticle_SystemAccount]
GO

ALTER TABLE [dbo].[NewsTag]  WITH CHECK ADD  CONSTRAINT [FK_NewsTag_NewsArticle] FOREIGN KEY([NewsArticleID])
REFERENCES [dbo].[NewsArticle] ([NewsArticleID])
GO
ALTER TABLE [dbo].[NewsTag] CHECK CONSTRAINT [FK_NewsTag_NewsArticle]
GO

ALTER TABLE [dbo].[NewsTag]  WITH CHECK ADD  CONSTRAINT [FK_NewsTag_Tag] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tag] ([TagID])
GO
ALTER TABLE [dbo].[NewsTag] CHECK CONSTRAINT [FK_NewsTag_Tag]
GO

USE [master]
GO
