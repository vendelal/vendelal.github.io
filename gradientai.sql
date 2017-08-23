-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Aug 23, 2017 at 02:47 AM
-- Server version: 5.6.35
-- PHP Version: 7.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gradientai`
--
CREATE DATABASE IF NOT EXISTS `gradientai` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `gradientai`;

-- --------------------------------------------------------

--
-- Table structure for table `craft_assetfiles`
--

CREATE TABLE `craft_assetfiles` (
  `id` int(11) NOT NULL,
  `sourceId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `kind` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `width` int(11) UNSIGNED DEFAULT NULL,
  `height` int(11) UNSIGNED DEFAULT NULL,
  `size` bigint(20) UNSIGNED DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_assetfolders`
--

CREATE TABLE `craft_assetfolders` (
  `id` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `sourceId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_assetindexdata`
--

CREATE TABLE `craft_assetindexdata` (
  `id` int(11) NOT NULL,
  `sessionId` varchar(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sourceId` int(10) NOT NULL,
  `offset` int(10) NOT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `recordId` int(10) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_assetsources`
--

CREATE TABLE `craft_assetsources` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `fieldLayoutId` int(10) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_assettransformindex`
--

CREATE TABLE `craft_assettransformindex` (
  `id` int(11) NOT NULL,
  `fileId` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sourceId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT NULL,
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_assettransforms`
--

CREATE TABLE `craft_assettransforms` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mode` enum('stretch','fit','crop') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'center-center',
  `height` int(10) DEFAULT NULL,
  `width` int(10) DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quality` int(10) DEFAULT NULL,
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_categories`
--

CREATE TABLE `craft_categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_categorygroups`
--

CREATE TABLE `craft_categorygroups` (
  `id` int(11) NOT NULL,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_categorygroups_i18n`
--

CREATE TABLE `craft_categorygroups_i18n` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `urlFormat` text COLLATE utf8_unicode_ci,
  `nestedUrlFormat` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_content`
--

CREATE TABLE `craft_content` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_body` text COLLATE utf8_unicode_ci,
  `field_headline` text COLLATE utf8_unicode_ci,
  `field_leadText` text COLLATE utf8_unicode_ci,
  `field_aboutYou` text COLLATE utf8_unicode_ci,
  `field_responsibilities` text COLLATE utf8_unicode_ci,
  `field_youWill` text COLLATE utf8_unicode_ci,
  `field_desiredSkills` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_content`
--

INSERT INTO `craft_content` (`id`, `elementId`, `locale`, `title`, `field_body`, `field_headline`, `field_leadText`, `field_aboutYou`, `field_responsibilities`, `field_youWill`, `field_desiredSkills`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'en_us', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-07-12 16:27:05', '2017-07-12 16:27:05', '840966b5-7645-4a3f-86cd-fbbd169bb6c9'),
(2, 2, 'en_us', 'Outperform your peers.', '<p>A product-focused predictive analytics group within Milliman</p>', NULL, 'Insurance companies that efficiently leverage data outperform their peers. We work with large, real-world datasets, and apply advanced techniques spanning optimization, statistics, and artificial intelligence.', NULL, NULL, NULL, NULL, '2017-07-12 16:27:08', '2017-07-12 17:24:20', 'beb67c99-c54e-49ce-a651-4f6cd2f44c2a'),
(3, 3, 'en_us', 'We just installed Craft!', '<p>Craft is the CMS that’s powering Localhost. It’s beautiful, powerful, flexible, and easy-to-use, and it’s made by Pixel &amp; Tonic. We can’t wait to dive in and see what it’s capable of!</p><!--pagebreak--><p>This is even more captivating content, which you couldn’t see on the News index page because it was entered after a Page Break, and the News index template only likes to show the content on the first page.</p><p>Craft: a nice alternative to Word, if you’re making a website.</p>', NULL, NULL, NULL, NULL, NULL, NULL, '2017-07-12 16:27:08', '2017-07-12 16:27:08', 'fb7d3854-b1b3-45c1-a01a-b9e64eb5bafd'),
(4, 4, 'en_us', 'Power up your team', '<p>We use predictive data analytics to augment human intelligence. Give your team the right tools to uncover formerly hidden patterns underlying your large, structured and unstructured datasets.</p>\n<p>Our goal is to help your business exceed the most important goals by taking a deeper look into your data to provide more accurate insights. We work to improve your revenue and profitability by turning your most valuable asset (your employees) into your greatest competitive advantage.</p>', NULL, NULL, NULL, NULL, NULL, NULL, '2017-07-12 16:35:14', '2017-07-12 16:35:14', '19352d6e-3d2e-486e-bbea-56b15b97d69f'),
(5, 5, 'en_us', 'Understand the present and adapt to the future', '<p>Patterns underlying big data are non-linear. Machine learning to uncover these patterns has been historically underutilized within the insurance industry. </p>\n<p>gradientA.I. has the solutions in place to deliver with uncompromising agility. Insurance companies that can effectively leverage the power of their data outperform their peers, our product offering allows our customers to know more sooner.</p>', NULL, NULL, NULL, NULL, NULL, NULL, '2017-07-12 17:21:16', '2017-07-12 17:21:16', '23999278-43fb-4e94-afd2-4893bf155dab'),
(6, 6, 'en_us', 'Your experience and our technology', '<p>At gradientAI, we’re tackling some of the most challenging problems within the insurance and healthcare industry while leveraging advanced data analysis and machine intelligence. </p>\n<p><strong>You have the historical data and the deep understanding of the challenges. Our team will work with you to address these challenges using our product that prioritizes your needs.</strong><strong> </strong></p>\n<p>We strive to establish a true partnership to help you get the most out of our products and engineering expertise.</p>', NULL, NULL, NULL, NULL, NULL, NULL, '2017-07-12 17:22:09', '2017-07-12 17:22:09', '599b292b-ed80-4a8b-bc6c-d69a722d988f'),
(7, 7, 'en_us', 'Our Team', '<p>Join us on our mission to solve the most challenging problems in the healthcare and insurance industry. At gradient A.I., talented and motivated successful startup veterans, software engineers, and data scientists representing the best schools in the country work together to deliver impactful products to our customers. </p>\n<p>We work with large, real-world datasets and advanced techniques spanning artificial intelligence, optimization and statistics. Our work has tangible impact: our solutions enable data driven decisions that lead to improved financial performance for our customers as well as better treatment and outcomes for individuals. </p>\n<p><strong>Come help us shape the future</strong></p>', NULL, NULL, NULL, NULL, NULL, NULL, '2017-07-12 17:22:39', '2017-07-12 17:22:39', 'f26766b0-07b3-4c23-9947-9276825f5ea5'),
(8, 8, 'en_us', 'Workers’ Comp', '<p>The gradient A.I. solution is aimed at solving a broad range of business problems starting with early identification of “creeping catastrophic” claims. <strong>“Creeping CATs,” while typically a small percentage of all non-CAT claims, usually account for the majority of total losses.</strong> Companies following best practices tend to identify these larger loss claims miss the “window of suggestibility” that provides the adjuster with the greatest opportunity to positively influence claim outcome.</p>\n<p>Despite the drop in claim frequency the cost of claims in workers’ compensation is rising at rates similar to overall wage costs. In addition to this accelerating cost curve, frequency tends to pick up with an accelerating economy leading to even faster growth of costs.</p>\n<p>A growing number of companies are taking advantage of the gradient A.I.’s powerful suite of decision support solutions to help identify both the claims with the highest risk of cost and duration, as well as identifying the most impactful intervention strategies that can have the greatest positive outcome at every point throughout the life of a claim.</p>\n<p>With integrated reporting capabilities, which combine all claims data through both internal and external systems, our customers are provided with a comprehensive and accurate decision support platform.</p>', NULL, NULL, NULL, NULL, NULL, NULL, '2017-07-12 17:26:36', '2017-07-12 17:26:36', '2aa0dc49-b7b3-47a1-8964-3aa722290fde'),
(9, 9, 'en_us', 'Underwriting', '<p>gradient A.I. uses the most advanced machine learning based analytics to combine our clients’data in tandem with big data from existing partnerships to provide improved risk selection and pricing.</p>\n<p><strong>A recent poll of 300+ insurance companies suggested that on average each company is utilizing approximately 15% of their internal data. Put simply, companies have a vast amount of data on hand but lack the necessary tools to take advantage of their existing data.</strong></p>\n<p>Our capabilities increase the power of internal data by efficiently pulling together all internal data, both structured and unstructured, with external “Big Data” to overcome the issue of “we don’t have enough data.” The proof is in providing more accurate pricing and better performingpolicies. The addition of integrated reporting provides accurate and timely analysis of business strategies and the ability to identify emerging opportunities to gain a competitive edge in the marketplace.</p>\n<p>The gradient A.I. underwriting platform improves efficiency and reduces quote turnaround time, including automated decision-making support. Our learning based models constantly measure underwriting performance to identify changes in the underlying risks long before traditional approaches.</p>', NULL, NULL, NULL, NULL, NULL, NULL, '2017-07-12 17:27:06', '2017-07-12 17:27:06', '501f0555-331f-4a56-bd93-fa45af71bd3d'),
(10, 10, 'en_us', 'Data Warehouse', '<p>The gradient A.I. Data Warehouse leverages the latest artificial intelligence technologies to provide clients the fastest time to access data across all internal operational systems. The process uses AI to gather client data from multiple sources, deposit the data into the data warehouse and normalize the data in a single comprehensive data silo. This platform allows clients to gain actionable insights into their data on a macro or micro level through the latest commercial business intelligence solutions such as Tableau or Power BI.<br /></p>\n<p><strong>The breakthrough from gradient A.I. comes from applying machine learning capabilities on the data intake and normalization through our licensed adaptive learning engine, the DCA (Digital Collection Agent), to eliminate the costly and time consuming efforts traditionally required to build and support an enterprise class data warehouse initiative.</strong><strong> </strong></p>\n<p>This approach allows data intake and management to be handled internally efficiently without adding extra steps in the process for our clients.</p>\n<p>The gradient A.I. Data Warehouse reduces time, cost and resources required for our clients while empowering them with powerful results that had been eluding them prior to having access to the gradient A.I. Data Warehouse.</p>', NULL, NULL, NULL, NULL, NULL, NULL, '2017-07-12 17:27:29', '2017-07-12 17:27:29', 'da47a1d1-d1e8-4a6b-b399-dc0486be0d26'),
(11, 11, 'en_us', 'Jobs', NULL, 'Come work with us!', 'We are looking for motivated, critical and creative thinkers to contribute to our team as software engineers. You will use what you have learned in class and be able to apply it alongside a team of engineers representing the best schools in the area. You are comfortable thinking outside the box across projects and use-cases. You are able to hit the ground running, independent, fast learner, comfortable within fast-paced, unstructured environment.Don’t see your position listed? We are always looking for talented and amazing people to join our team, please email us at jobs@gradientai.com.', NULL, NULL, NULL, NULL, '2017-07-12 18:22:37', '2017-07-12 18:46:03', '96972691-cb51-47b2-958a-99254bc385ec'),
(12, 12, 'en_us', 'Equal Opportunities', '<p>Equal Opportunity Employer/Protected Veterans/Individuals with Disabilities</p>\n<p>The contractor will not discharge or in any other manner discriminate against employees or applicants because they have inquired about, discussed, or disclosed their own pay or the pay of another employee or applicant. However, employees who have access to the compensation information of other employees or applicants as a part of their essential job functions cannot disclose the pay of other employees or applicants to individuals who do not otherwise have access to compensation information, unless the disclosure is (a) in response to a formal complaint or charge, (b) in furtherance of an investigation, proceeding, hearing, or action, including an investigation conducted by the employer, or (c) consistent with the contractor’s legal duty to furnish information.</p>', NULL, NULL, NULL, NULL, NULL, NULL, '2017-07-12 18:33:57', '2017-07-12 18:33:57', '86b98564-76f0-47a3-8944-3c362fcf1196'),
(13, 13, 'en_us', 'Data Scientist', NULL, NULL, NULL, '<p><strong>About You</strong></p>\n<p>We are seeking talented data scientists to join our data modeling team. This position will help define how our products will evolve by working closely with engineers to rapidly prototype new features and complementary products, delivering our customers actionable intelligence from large data sets. The role involves research as well as software implementations of machine learning prototypes and experiments. Data Scientists are required to be able to understand user needs through interaction with client-facing staff, architect solutions and shepherd products through prototype phase. Requirements will be vague. Iterations will be rapid and we seek researchers who are nimble and willing to take smart risks. BS/MS to Ph.D levels available.</p>', '<p><strong>Responsibilities</strong></p>\n<p>You are equal parts researcher, information architect and hacker. You will communicate and collaborate with software engineers. You must enjoy developing creative solutions to difficult problems in an autonomous, startup environment with direct contact to top management and industry experts. You are passionate about innovating and enjoy independence to pursue designated goals.</p>', '<p><strong>You will:</strong></p>\n<p>- Mine and analyze data pertaining to discover critical business insights</p>\n<p>- Generate ideas for new products, from directing high-level concept formation to prototyping</p>\n<p>- Synthesize research data, turning data to actionable insights and specific model requirements </p>\n<p>- Quickly deploy out-of the-box solutions where possible, innovate when necessary </p>\n<p>- Stay current with advancements in machine learning and advocate for the appropriate application of those advancements in our own products </p>\n<p>- Work closely with engineers and production developers to ensure clear, effective communication within the team </p>\n<p>- Occasionally develop short, optimized pieces of code</p>', '<p><strong>Desired Skills</strong></p>\n<p>The interdisciplinary nature of our work calls for an unusual mixture of skills that few may already possess. What is most important is that you are exceptional in what you do know, and have the desire, willingness, and ability to learn new things quickly and build upon your current set of skills.The ideal candidate will have some or all of the following qualifications:</p>\n<p>- Machine learning and/or statistics coursework </p>\n<p>- Familiarity with recent large-scale machine learning tools (e.g. TensorFlow, Torch, Spark, Hadoop) a plus, but not required.</p>\n<p>- Familiarity with a modern scripting language (like Python) </p>\n<p>- Database experience (SQL) a plus, but not required </p>\n<p>- Research oriented – you seek to understand model behavior, not just apply tools blindly </p>\n<p>- Able to adapt quickly, and draw from a range of tools as needed </p>\n<p>- Industry experience a plus</p>', '2017-07-12 18:38:54', '2017-07-12 18:38:54', 'efd4ded1-b803-4ad0-88b5-db6fbaa944b0'),
(14, 14, 'en_us', 'Software Engineer', NULL, NULL, NULL, '<p><strong>About You</strong></p>\n<p>In this role, you will contribute towards building new functionality for our platform by applying what you know, learning new technologies and tools, and expanding your competence in multiple areas; you will contribute towards building and improving our current platform to help us fundamentally change the way an entire industry works.</p>', '<p><strong>Responsibilities</strong></p>\n<p>You’ll contribute to any and all parts of our flow for developing and deploying high-volume predictive models: from data infrastructure to modeling engines and algorithms, to high-performance cloud computing interfaces, to client-facing BI/analytics. </p>', '<p><strong>You will:</strong></p>\n<p>- Assist Integration of predictive models into database-backed environments, real-time query APIs, and existing modeling pipelines, considering computational and other constraints.</p>\n<p>- Contribute to significant strategic projects focused on enhancements to core tooling, automation, scalability, and broad statistical machine learning capabilities.</p>\n<p>- Collaborate with other team members, including machine learning researchers, database engineers and project managers, to design, generalize, optimize and implement predictive models and research.</p>', '<p><strong>Desired Skills</strong></p>\n<p>The nature of your work calls for a unique mixture of skills. What is most important is that you are exceptional in what you do know, and have the desire and ability to learn new things quickly and build on your current set of skills.</p>\n<p><strong>Required qualifications</strong></p>\n<p>- Currently pursuing a BS level or higher in CS or have an applicable background.</p>\n<p>- Fluency in modern scripting languages, ideally Python.</p>\n<p>- Experience with predictive analytics, algorithms, or machine learning, and at least one supporting technology stack (e.g., Spark, TensorFlow, sklearn).</p>\n<p>- Ability to pay close attention to detail.</p>', '2017-07-12 18:40:21', '2017-07-12 18:40:21', '16b2fbbd-7d38-48e7-9fc4-97014fb53915'),
(15, 15, 'en_us', 'Senior Software Engineer', NULL, NULL, NULL, '<p><strong>About You</strong></p>\n<p>In this role, we are looking for someone who not only can contribute at a high level to make the best products for our clients. You will be given the freedom to maximize the potential of our existing products as well as create new features for our clients. You will be challenged and you will shape this business, and by extension, the way the industries we serve leverage data and predictive analytics. You will expand your competence and explore new technologies at the intersection of machine learning, engineering, and product delivery.</p>', '<p><strong>Responsibilities</strong></p>\n<p>You and your team will contribute to any and all parts of our flow for developing and deploying high-volume predictive models: from data infrastructure to modeling engines and algorithms, to high-performance cloud computing interfaces, to client-facing BI/analytics. </p>', '<p><strong>You will:</strong></p>\n<p>- Design, own and lead significant strategic projects focused on enhancements to core model tooling, automation, and scalability.</p>\n<p>- Build on our current vision and roadmap around platform strategy.</p>\n<p>- Scale and optimize existing pipelines, and advance process repeatability.</p>\n<p>- Collaborate with the research team members to translate research into practice.</p>\n<p>- Engineer effective systems to deploy products in a robust and scalable environment.</p>\n<p>- Design and build systems for end-to-end high throughput data handling, and integrate predictive models into database-backed environments, client-facing APIs, and existing modeling pipelines.</p>', '<p><strong>Desired Skills</strong></p>\n<p>The interdisciplinary nature of our work calls for an unusual mixture of skills that few may already possess. What is most important is that you are exceptional in what you do know, and have the desire, willingness, and ability to learn new things quickly and build upon your current set of skills.The ideal candidate will have some or all of the following qualifications:</p>\n<p>- BS/MS/PhD in CS, or equivalent experience and self-education.</p>\n<p>- Minimum of 5 years of experience in software engineering.</p>\n<p>- Experience as a software architect/lead architect.</p>\n<p>- Experience with predictive analytics, algorithms, or machine learning, and supporting stacks (e.g. Spark MLlib, TensorFlow, scikit-learn).</p>\n<p>- A working knowledge of SQL, and/or experience with non-relational/alternative databases.</p>\n<p>- Experience with a cloud-computing environment (e.g. Amazon EC2).</p>\n<p>- Experience with distributed computing frameworks (e.g. Apache Spark).<br /></p>', '2017-07-12 18:44:35', '2017-07-12 18:44:35', '19aca2b0-c45b-4565-9a4a-148b05af5170'),
(16, 16, 'en_us', 'Solutions', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-07-12 20:39:34', '2017-07-12 20:39:34', '8b8816d0-540d-4325-bef1-bdcbae123786');

-- --------------------------------------------------------

--
-- Table structure for table `craft_deprecationerrors`
--

CREATE TABLE `craft_deprecationerrors` (
  `id` int(11) NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fingerprint` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `line` smallint(6) UNSIGNED NOT NULL,
  `class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `method` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `templateLine` smallint(6) UNSIGNED DEFAULT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `traces` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_elementindexsettings`
--

CREATE TABLE `craft_elementindexsettings` (
  `id` int(11) NOT NULL,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_elements`
--

CREATE TABLE `craft_elements` (
  `id` int(11) NOT NULL,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `archived` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_elements`
--

INSERT INTO `craft_elements` (`id`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'User', 1, 0, '2017-07-12 16:27:05', '2017-07-12 16:27:05', '3f708361-fee2-4222-af58-4c37d87b31ee'),
(2, 'Entry', 1, 0, '2017-07-12 16:27:08', '2017-07-12 17:24:20', '5e00fa16-5bf9-4b0f-b553-8b70961fbe4a'),
(3, 'Entry', 1, 0, '2017-07-12 16:27:08', '2017-07-12 16:27:08', '9110df68-52ab-45ff-b919-456173efa366'),
(4, 'Entry', 1, 0, '2017-07-12 16:35:14', '2017-07-12 16:35:14', '6bbef77f-10a2-43f2-b898-49fb7d61b835'),
(5, 'Entry', 1, 0, '2017-07-12 17:21:16', '2017-07-12 17:21:16', '8ba61521-48ac-4941-a40a-4fc394219b38'),
(6, 'Entry', 1, 0, '2017-07-12 17:22:09', '2017-07-12 17:22:09', 'cc1fe34a-5c2e-4ed1-9500-931399ba20a1'),
(7, 'Entry', 1, 0, '2017-07-12 17:22:39', '2017-07-12 17:22:39', 'e5e4bcf1-3f52-4d57-bd71-bc69fab4ec4a'),
(8, 'Entry', 1, 0, '2017-07-12 17:26:36', '2017-07-12 17:26:36', 'a29dc90a-00b0-46b9-917b-af195f96b5f3'),
(9, 'Entry', 1, 0, '2017-07-12 17:27:06', '2017-07-12 17:27:06', '0b534d96-223b-40be-8a8e-cbe1bc52ba43'),
(10, 'Entry', 1, 0, '2017-07-12 17:27:29', '2017-07-12 17:27:29', '3b567786-761f-49e2-b9b7-a40bd2ee783e'),
(11, 'Entry', 1, 0, '2017-07-12 18:22:37', '2017-07-12 18:46:03', 'b2d09e11-7e97-4152-ab32-017d76a7b894'),
(12, 'Entry', 1, 0, '2017-07-12 18:33:57', '2017-07-12 18:33:57', '1042770d-1079-47d5-883a-dd0b485a7438'),
(13, 'Entry', 1, 0, '2017-07-12 18:38:54', '2017-07-12 18:38:54', '312980c6-f088-4274-80da-16aa8ee37f5c'),
(14, 'Entry', 1, 0, '2017-07-12 18:40:21', '2017-07-12 18:40:21', '2f14af3d-a2fa-42f0-a067-5d13a2b95d93'),
(15, 'Entry', 1, 0, '2017-07-12 18:44:35', '2017-07-12 18:44:35', 'a655aea7-de46-4e64-aa50-ebeb98047e95'),
(16, 'Entry', 1, 0, '2017-07-12 20:39:34', '2017-07-12 20:39:34', '968331f2-c9d4-46ef-907c-4af4fc8946e6');

-- --------------------------------------------------------

--
-- Table structure for table `craft_elements_i18n`
--

CREATE TABLE `craft_elements_i18n` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_elements_i18n`
--

INSERT INTO `craft_elements_i18n` (`id`, `elementId`, `locale`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'en_us', '', NULL, 1, '2017-07-12 16:27:05', '2017-07-12 16:27:05', '71528634-e886-49cd-8812-d85012cc7e97'),
(2, 2, 'en_us', 'homepage', '__home__', 1, '2017-07-12 16:27:08', '2017-07-12 17:24:20', 'b29adb2f-191e-4f9c-8f41-0ae7cd8bb5ef'),
(3, 3, 'en_us', 'we-just-installed-craft', 'news/2017/we-just-installed-craft', 1, '2017-07-12 16:27:08', '2017-07-12 16:27:08', 'cc7dfc9c-a9a2-4ec6-9d0e-28fe150e1931'),
(4, 4, 'en_us', 'power-up-your-team', NULL, 1, '2017-07-12 16:35:14', '2017-07-12 16:35:14', 'd016aa40-b319-467d-8f4b-d88b3837700c'),
(5, 5, 'en_us', 'understand-the-present-and-adapt-to-the-future', NULL, 1, '2017-07-12 17:21:16', '2017-07-12 17:21:17', 'b4506082-14e4-43bb-8da2-0fde1c4fe3b2'),
(6, 6, 'en_us', 'your-experience-and-our-technology', NULL, 1, '2017-07-12 17:22:09', '2017-07-12 17:22:09', '45ca22cc-89e4-4ed0-9df6-a285cb646c94'),
(7, 7, 'en_us', 'our-team', NULL, 1, '2017-07-12 17:22:39', '2017-07-12 17:22:39', 'e62336c9-887f-4737-8849-75a6a29f9fa3'),
(8, 8, 'en_us', 'workers-comp', NULL, 1, '2017-07-12 17:26:36', '2017-07-12 17:26:36', 'c6cde344-f9c1-4d0b-9a53-51b8c20155eb'),
(9, 9, 'en_us', 'underwriting', NULL, 1, '2017-07-12 17:27:06', '2017-07-12 17:27:06', '7a744b56-8d04-4bb9-9dad-5be04a2fe8a5'),
(10, 10, 'en_us', 'data-warehouse', NULL, 1, '2017-07-12 17:27:29', '2017-07-12 17:27:29', '69198884-9796-493c-818a-08e0752711c3'),
(11, 11, 'en_us', 'jobs', 'jobs', 1, '2017-07-12 18:22:37', '2017-07-12 18:46:04', '5dffc7c9-6f25-4600-93dc-f26cb47cfaf8'),
(12, 12, 'en_us', 'equal-opportunities', 'job-postings/equal-opportunities', 1, '2017-07-12 18:33:57', '2017-07-12 18:33:57', '4e80098a-0c87-4c0e-9d79-a9f797c87e77'),
(13, 13, 'en_us', 'data-scientist', 'job-postings/data-scientist', 1, '2017-07-12 18:38:54', '2017-07-12 18:38:54', 'aa911457-81e8-487e-bd56-df54c8f1fde6'),
(14, 14, 'en_us', 'software-engineer', 'job-postings/software-engineer', 1, '2017-07-12 18:40:21', '2017-07-12 18:40:35', 'a1c943f3-f4aa-4031-b587-7bbc085af8b9'),
(15, 15, 'en_us', 'senior-software-engineer', 'job-postings/senior-software-engineer', 1, '2017-07-12 18:44:35', '2017-07-12 18:44:40', 'c0298cd2-d287-42b0-94ee-8b59aded75c0'),
(16, 16, 'en_us', 'solutions', 'solutions', 1, '2017-07-12 20:39:34', '2017-07-12 20:39:34', '0b02fb5b-e8a5-48c2-af01-aa7f51c16179');

-- --------------------------------------------------------

--
-- Table structure for table `craft_emailmessages`
--

CREATE TABLE `craft_emailmessages` (
  `id` int(11) NOT NULL,
  `key` char(150) COLLATE utf8_unicode_ci NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_entries`
--

CREATE TABLE `craft_entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `typeId` int(11) DEFAULT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_entries`
--

INSERT INTO `craft_entries` (`id`, `sectionId`, `typeId`, `authorId`, `postDate`, `expiryDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(2, 1, NULL, NULL, '2017-07-12 16:27:08', NULL, '2017-07-12 16:27:08', '2017-07-12 17:24:20', '493f0782-6d2c-4d31-98a2-5734ee7781f2'),
(3, 2, 2, 1, '2017-07-12 16:27:08', NULL, '2017-07-12 16:27:08', '2017-07-12 16:27:08', 'e53e50a7-1faf-4063-8a89-e66949e6be1d'),
(4, 3, 4, 1, '2017-07-12 16:35:14', NULL, '2017-07-12 16:35:14', '2017-07-12 16:35:14', '8a838715-c2ce-4b20-8855-feed7bcbd02c'),
(5, 3, 4, 1, '2017-07-12 17:21:16', NULL, '2017-07-12 17:21:16', '2017-07-12 17:21:16', '6c454a20-e650-4155-a649-6380e953d119'),
(6, 3, 4, 1, '2017-07-12 17:22:09', NULL, '2017-07-12 17:22:09', '2017-07-12 17:22:09', '53784ff4-550d-413b-a49a-b32ee0eeffaa'),
(7, 3, 4, 1, '2017-07-12 17:22:39', NULL, '2017-07-12 17:22:39', '2017-07-12 17:22:39', 'f3869dc3-6bd4-4c7a-851b-3afde19948de'),
(8, 5, 6, 1, '2017-07-12 17:26:36', NULL, '2017-07-12 17:26:36', '2017-07-12 17:26:36', 'f7ade025-6f0f-472c-8b2c-7daaa5c3584a'),
(9, 5, 6, 1, '2017-07-12 17:27:06', NULL, '2017-07-12 17:27:06', '2017-07-12 17:27:06', '1a21d5e1-8626-44a5-af41-e71f561fa9bf'),
(10, 5, 6, 1, '2017-07-12 17:27:29', NULL, '2017-07-12 17:27:29', '2017-07-12 17:27:29', 'd59da824-a5b1-47ae-a344-5248bc649a12'),
(11, 6, 7, NULL, '2017-07-12 18:34:58', NULL, '2017-07-12 18:22:37', '2017-07-12 18:46:04', '9d63f9bb-14f4-4ca8-a282-4967db8955b1'),
(12, 7, 9, 1, '2017-07-12 18:33:57', NULL, '2017-07-12 18:33:57', '2017-07-12 18:33:57', 'daf364cd-a894-443d-a503-31ac4d5c3f91'),
(13, 7, 8, 1, '2017-07-12 18:38:54', NULL, '2017-07-12 18:38:54', '2017-07-12 18:38:54', 'c830fe78-4de0-4640-aeb0-0fb9208834e1'),
(14, 7, 8, 1, '2017-07-12 18:40:21', NULL, '2017-07-12 18:40:21', '2017-07-12 18:40:21', '3665b2d1-c978-4b7b-bb1e-139c65c57465'),
(15, 7, 8, 1, '2017-07-12 18:44:35', NULL, '2017-07-12 18:44:35', '2017-07-12 18:44:35', '2a71f3bf-4bae-494e-b98b-7da0f74a08d3'),
(16, 4, NULL, NULL, '2017-07-12 20:39:33', NULL, '2017-07-12 20:39:34', '2017-07-12 20:39:34', 'b56641c2-0073-467d-9b22-8fb5d4d03365');

-- --------------------------------------------------------

--
-- Table structure for table `craft_entrydrafts`
--

CREATE TABLE `craft_entrydrafts` (
  `id` int(11) NOT NULL,
  `entryId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `creatorId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notes` tinytext COLLATE utf8_unicode_ci,
  `data` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_entrytypes`
--

CREATE TABLE `craft_entrytypes` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasTitleField` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `titleLabel` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'Title',
  `titleFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_entrytypes`
--

INSERT INTO `craft_entrytypes` (`id`, `sectionId`, `fieldLayoutId`, `name`, `handle`, `hasTitleField`, `titleLabel`, `titleFormat`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 8, 'Homepage', 'homepage', 1, 'Title', NULL, 1, '2017-07-12 16:27:08', '2017-07-12 17:24:04', 'c7af8abd-d386-4239-be40-4364935cbd76'),
(2, 2, 5, 'News', 'news', 1, 'Title', NULL, 1, '2017-07-12 16:27:08', '2017-07-12 16:27:08', '03692ba6-62b1-4750-8982-e0e4397a3d84'),
(4, 3, 7, 'Homepage Content', 'homepageContent', 1, 'Title', NULL, 2, '2017-07-12 16:33:52', '2017-07-12 16:33:52', '9faf638c-1f3d-4b78-9708-ea637cf12116'),
(5, 4, 9, 'Solutions', 'solutions', 1, 'Title', NULL, 1, '2017-07-12 17:24:54', '2017-07-12 17:24:54', '6f132774-8694-4b0a-93b6-6fc23d06d749'),
(6, 5, 11, 'Solutions Content', 'solutionsContent', 1, 'Title', NULL, 1, '2017-07-12 17:25:10', '2017-07-12 17:25:53', 'f3712957-a7ce-401f-8692-0b0581722f5e'),
(7, 6, 15, 'Jobs', 'jobs', 1, 'Title', NULL, 1, '2017-07-12 18:22:18', '2017-07-12 18:24:47', 'def87610-0396-46b5-b775-36faa5972b09'),
(8, 7, 14, 'Job Postings', 'jobPostings', 1, 'Title', NULL, 1, '2017-07-12 18:22:56', '2017-07-12 18:23:25', '331c6176-1e27-4226-86af-01ee04dbe1e4'),
(9, 7, 16, 'Equal Opportunities', 'equalOpportunities', 1, 'Title', NULL, 2, '2017-07-12 18:25:12', '2017-07-12 18:25:12', 'e3abe8c6-82b4-4cf2-8274-56c4f918c614');

-- --------------------------------------------------------

--
-- Table structure for table `craft_entryversions`
--

CREATE TABLE `craft_entryversions` (
  `id` int(11) NOT NULL,
  `entryId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `num` smallint(6) UNSIGNED NOT NULL,
  `notes` tinytext COLLATE utf8_unicode_ci,
  `data` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_entryversions`
--

INSERT INTO `craft_entryversions` (`id`, `entryId`, `sectionId`, `creatorId`, `locale`, `num`, `notes`, `data`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 2, 1, 1, 'en_us', 1, NULL, '{\"typeId\":\"1\",\"authorId\":null,\"title\":\"Homepage\",\"slug\":\"homepage\",\"postDate\":1499876828,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":[]}', '2017-07-12 16:27:08', '2017-07-12 16:27:08', '92647ef5-c9e7-4969-8ed5-7b7747452062'),
(2, 2, 1, 1, 'en_us', 2, NULL, '{\"typeId\":null,\"authorId\":null,\"title\":\"Welcome to Localhost!\",\"slug\":\"homepage\",\"postDate\":1499876828,\"expiryDate\":null,\"enabled\":\"1\",\"parentId\":null,\"fields\":{\"1\":\"<p>It\\u2019s true, this site doesn\\u2019t have a whole lot of content yet, but don\\u2019t worry. Our web developers have just installed the CMS, and they\\u2019re setting things up for the content editors this very moment. Soon Localhost will be an oasis of fresh perspectives, sharp analyses, and astute opinions that will keep you coming back again and again.<\\/p>\"}}', '2017-07-12 16:27:08', '2017-07-12 16:27:08', '21889add-f13c-4fd1-871a-5572341099d2'),
(3, 3, 2, 1, 'en_us', 1, NULL, '{\"typeId\":\"2\",\"authorId\":\"1\",\"title\":\"We just installed Craft!\",\"slug\":\"we-just-installed-craft\",\"postDate\":1499876828,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":[]}', '2017-07-12 16:27:08', '2017-07-12 16:27:08', 'a0dbace3-e23d-4a27-bdba-f99588269264'),
(4, 4, 3, 1, 'en_us', 1, '', '{\"typeId\":null,\"authorId\":\"1\",\"title\":\"Power up your team\",\"slug\":\"power-up-your-team\",\"postDate\":1499877314,\"expiryDate\":null,\"enabled\":1,\"parentId\":\"\",\"fields\":{\"1\":\"<p>We use predictive data analytics to augment human intelligence. Give your team the right tools to uncover formerly hidden patterns underlying your large, structured and unstructured datasets.<\\/p>\\r\\n<p>Our goal is to help your business exceed the most important goals by taking a deeper look into your data to provide more accurate insights. We work to improve your revenue and profitability by turning your most valuable asset (your employees) into your greatest competitive advantage.<\\/p>\"}}', '2017-07-12 16:35:14', '2017-07-12 16:35:14', 'dd092e99-641b-4b19-85f6-e3f1e648fed6'),
(5, 5, 3, 1, 'en_us', 1, '', '{\"typeId\":null,\"authorId\":\"1\",\"title\":\"Understand the present and adapt to the future\",\"slug\":\"understand-the-present-and-adapt-to-the-future\",\"postDate\":1499880076,\"expiryDate\":null,\"enabled\":1,\"parentId\":\"\",\"fields\":{\"1\":\"<p>Patterns underlying big data are non-linear. Machine learning to uncover these patterns has been historically underutilized within the insurance industry.<span class=\\\"Apple-converted-space\\\">&nbsp;<\\/span><\\/p>\\r\\n<p>gradientA.I. has the solutions in place to deliver with uncompromising agility. Insurance companies that can effectively leverage the power of their data outperform their peers, our product offering allows our customers to know more sooner.<\\/p>\"}}', '2017-07-12 17:21:16', '2017-07-12 17:21:16', 'a596ff72-9748-435c-9eac-7b8c5e29e541'),
(6, 6, 3, 1, 'en_us', 1, '', '{\"typeId\":null,\"authorId\":\"1\",\"title\":\"Your experience and our technology\",\"slug\":\"your-experience-and-our-technology\",\"postDate\":1499880129,\"expiryDate\":null,\"enabled\":1,\"parentId\":\"\",\"fields\":{\"1\":\"<p>At gradientAI, we\\u2019re tackling some of the most challenging problems within the insurance and healthcare industry while leveraging advanced data analysis and machine intelligence.<span class=\\\"Apple-converted-space\\\">&nbsp;<\\/span><\\/p>\\r\\n<p><strong>You have the historical data and the deep understanding of the challenges. Our team will work with you to address these challenges using our product that prioritizes your needs.<\\/strong><span class=\\\"Apple-converted-space\\\"><strong>&nbsp;<\\/strong><\\/span><\\/p>\\r\\n<p>We strive to establish a true partnership to help you get the most out of our products and engineering expertise.<\\/p>\"}}', '2017-07-12 17:22:09', '2017-07-12 17:22:09', 'bab0c8ac-3637-4dd2-8fa7-40d4bd09a526'),
(7, 7, 3, 1, 'en_us', 1, '', '{\"typeId\":null,\"authorId\":\"1\",\"title\":\"Our Team\",\"slug\":\"our-team\",\"postDate\":1499880159,\"expiryDate\":null,\"enabled\":1,\"parentId\":\"\",\"fields\":{\"1\":\"<p>Join us on our mission to solve the most challenging problems in the healthcare and insurance industry. At gradient A.I., talented and motivated successful startup veterans, software engineers, and data scientists representing the best schools in the country work together to deliver impactful products to our customers.<span class=\\\"Apple-converted-space\\\">&nbsp;<\\/span><\\/p>\\r\\n<p>We work with large, real-world datasets and advanced techniques spanning artificial intelligence, optimization and statistics. Our work has tangible impact: our solutions enable data driven decisions that lead to improved financial performance for our customers as well as better treatment and outcomes for individuals.<span class=\\\"Apple-converted-space\\\">&nbsp;<\\/span><\\/p>\\r\\n<p><strong>Come help us shape the future<\\/strong><\\/p>\"}}', '2017-07-12 17:22:39', '2017-07-12 17:22:39', '3230e64b-1e42-48b0-8ba2-d263a13ea770'),
(8, 2, 1, 1, 'en_us', 3, '', '{\"typeId\":null,\"authorId\":null,\"title\":\"Outperform your peers.\",\"slug\":\"homepage\",\"postDate\":1499876828,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"1\":\"<p>A product-focused predictive analytics group within Milliman<\\/p>\"}}', '2017-07-12 17:23:20', '2017-07-12 17:23:20', '93662816-cf2e-41ac-bc81-bf3a2c3b7f10'),
(9, 2, 1, 1, 'en_us', 4, '', '{\"typeId\":null,\"authorId\":null,\"title\":\"Outperform your peers.\",\"slug\":\"homepage\",\"postDate\":1499876828,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"1\":\"<p>A product-focused predictive analytics group within Milliman<\\/p>\",\"4\":\"Insurance companies that efficiently leverage data outperform their peers. We work with large, real-world datasets, and apply advanced techniques spanning optimization, statistics, and artificial intelligence.\"}}', '2017-07-12 17:24:20', '2017-07-12 17:24:20', 'ba691038-5eac-467f-a269-2c03e211cf7e'),
(10, 8, 5, 1, 'en_us', 1, '', '{\"typeId\":null,\"authorId\":\"1\",\"title\":\"Workers\\u2019 Comp\",\"slug\":\"workers-comp\",\"postDate\":1499880396,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"1\":\"<p>The gradient A.I. solution is aimed at solving a broad range of business problems starting with early identification of \\u201ccreeping catastrophic\\u201d claims. <strong>\\u201cCreeping CATs,\\u201d while typically a small percentage of all non-CAT claims, usually account for the majority of total losses.<\\/strong> Companies following best practices tend to identify these larger loss claims miss the<span class=\\\"s1\\\"> \\u201cw<\\/span>indow of suggestibilit<span class=\\\"s1\\\">y\\u201d <\\/span>that provides the adjuster with the greatest opportunity to positively influence claim outcome.<\\/p>\\r\\n<p>Despite the drop in claim frequency the cost of claims in workers\\u2019 compensation is rising at rates similar to overall wage costs. In addition to this accelerating cost curve, frequency tends to pick up with an accelerating economy leading to even faster growth of costs.<\\/p>\\r\\n<p>A growing number of companies are taking advantage of the gradient A.I.\\u2019s powerful suite of decision support solutions to help identify both the claims with the highest risk of cost and duration, as well as identifying the most impactful intervention strategies that can have the greatest positive outcome at every point throughout the life of a claim.<\\/p>\\r\\n<p>With integrated reporting capabilities, which combine all claims data through both internal and external systems, our customers are provided with a comprehensive and accurate decision support platform.<\\/p>\"}}', '2017-07-12 17:26:36', '2017-07-12 17:26:36', '0b13c801-1062-4068-8dc0-1f91e5e732e8'),
(11, 9, 5, 1, 'en_us', 1, '', '{\"typeId\":null,\"authorId\":\"1\",\"title\":\"Underwriting\",\"slug\":\"underwriting\",\"postDate\":1499880426,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"1\":\"<p>gradient A.I. uses the most advanced machine learning based analytics to combine our clients\\u2019data in tandem with big data from existing partnerships to provide improved risk selection and pricing.<\\/p>\\r\\n<p><strong>A recent poll of 300+ insurance companies suggested that on average each company is utilizing approximately 15% of their internal data. Put simply, companies have a vast amount of data on hand but lack the necessary tools to take advantage of their existing data.<\\/strong><\\/p>\\r\\n<p>Our capabilities increase the power of internal data by efficiently pulling together all internal data, both structured and unstructured, with external \\u201cBig Data\\u201d to overcome the issue of \\u201cwe don\\u2019t have enough data.\\u201d The proof is in providing more accurate pricing and better performingpolicies. The addition of integrated reporting provides accurate and timely analysis of business strategies and the ability to identify emerging opportunities to gain a competitive edge in the marketplace.<\\/p>\\r\\n<p>The gradient A.I. underwriting platform improves efficiency and reduces quote turnaround time, including automated decision-making support. Our learning based models constantly measure underwriting performance to identify changes in the underlying risks long before traditional approaches.<\\/p>\"}}', '2017-07-12 17:27:06', '2017-07-12 17:27:06', '7e9a2e8d-7ab1-4c2c-9153-e7a5c59fb509'),
(12, 10, 5, 1, 'en_us', 1, '', '{\"typeId\":null,\"authorId\":\"1\",\"title\":\"Data Warehouse\",\"slug\":\"data-warehouse\",\"postDate\":1499880449,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"1\":\"<p>The gradient A.I. Data Warehouse leverages the latest artificial intelligence technologies to provide clients the fastest time to access data across all internal operational systems. The process uses AI to gather client data from multiple sources, deposit the data into the data warehouse and normalize the data in a single comprehensive data silo. This platform allows clients to gain actionable insights into their data on a macro or micro level through the latest commercial business intelligence solutions such as Tableau or Power BI.<br><\\/p>\\r\\n<p><strong>The breakthrough from gradient A.I. comes from applying machine learning capabilities on the data intake and normalization through our licensed adaptive learning engine, the DCA (Digital Collection Agent), to eliminate the costly and time consuming efforts traditionally required to build and support an enterprise class data warehouse initiative.<\\/strong><span class=\\\"Apple-converted-space\\\"><strong>&nbsp;<\\/strong><\\/span><\\/p>\\r\\n<p>This approach allows data intake and management to be handled internally efficiently without adding extra steps in the process for our clients.<\\/p>\\r\\n<p>The gradient A.I. Data Warehouse reduces time, cost and resources required for our clients while empowering them with powerful results that had been eluding them prior to having access to the gradient A.I. Data Warehouse.<\\/p>\"}}', '2017-07-12 17:27:29', '2017-07-12 17:27:29', '72543e5d-0742-4d57-838c-3e4de1a2895b'),
(13, 11, 6, 1, 'en_us', 1, NULL, '{\"typeId\":\"7\",\"authorId\":null,\"title\":\"Jobs\",\"slug\":\"jobs\",\"postDate\":1499883757,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":[]}', '2017-07-12 18:22:37', '2017-07-12 18:22:37', 'c3897bed-3989-49ee-b761-2e18e82334d0'),
(14, 12, 7, 1, 'en_us', 1, '', '{\"typeId\":\"9\",\"authorId\":\"1\",\"title\":\"Equal Opportunities\",\"slug\":\"equal-opportunities\",\"postDate\":1499884437,\"expiryDate\":null,\"enabled\":1,\"parentId\":\"\",\"fields\":{\"1\":\"<p>Equal Opportunity Employer\\/Protected Veterans\\/Individuals with Disabilities<\\/p>\\r\\n<p>The contractor will not discharge or in any other manner discriminate against employees or applicants because they have inquired about, discussed, or disclosed their own pay or the pay of another employee or applicant. However, employees who have access to the compensation information of other employees or applicants as a part of their essential job functions cannot disclose the pay of other employees or applicants to individuals who do not otherwise have access to compensation information, unless the disclosure is (a) in response to a formal complaint or charge, (b) in furtherance of an investigation, proceeding, hearing, or action, including an investigation conducted by the employer, or (c) consistent with the contractor\\u2019s legal duty to furnish information.<\\/p>\"}}', '2017-07-12 18:33:57', '2017-07-12 18:33:57', 'aebb9cad-4bd1-4fb0-9dd4-7abff4772a09'),
(15, 13, 7, 1, 'en_us', 1, '', '{\"typeId\":\"8\",\"authorId\":\"1\",\"title\":\"Data Scientist\",\"slug\":\"data-scientist\",\"postDate\":1499884734,\"expiryDate\":null,\"enabled\":1,\"parentId\":\"\",\"fields\":{\"5\":\"<p><strong>About You<\\/strong><\\/p>\\r\\n<p>We are seeking talented data scientists to join our data modeling team. This position will help define how our products will evolve by working closely with engineers to rapidly prototype new features and complementary products, delivering our customers actionable intelligence from large data sets. The role involves research as well as software implementations of machine learning prototypes and experiments. Data Scientists are required to be able to understand user needs through interaction with client-facing staff, architect solutions and shepherd products through prototype phase. Requirements will be vague. Iterations will be rapid and we seek researchers who are nimble and willing to take smart risks. BS\\/MS to Ph.D levels available.<\\/p>\",\"8\":\"<p><strong>Desired Skills<\\/strong><\\/p>\\r\\n<p>The interdisciplinary nature of our work calls for an unusual mixture of skills that few may already possess. What is most important is that you are exceptional in what you do know, and have the desire, willingness, and ability to learn new things quickly and build upon your current set of skills.The ideal candidate will have some or all of the following qualifications:<\\/p>\\r\\n<p><span class=\\\"s1\\\">- <\\/span>Machine learning and\\/or statistics coursework<span class=\\\"Apple-converted-space\\\">&nbsp;<\\/span><\\/p>\\r\\n<p><span class=\\\"s1\\\">- <\\/span>Familiarity with recent large-scale machine learning tools (e.g. TensorFlow, Torch, Spark, Hadoop) a plus, but not required.<\\/p>\\r\\n<p><span class=\\\"s1\\\">- <\\/span>Familiarity with a modern scripting language (like Python)<span class=\\\"Apple-converted-space\\\">&nbsp;<\\/span><\\/p>\\r\\n<p><span class=\\\"s1\\\">- <\\/span>Database experience (SQL) a plus, but not required<span class=\\\"Apple-converted-space\\\">&nbsp;<\\/span><\\/p>\\r\\n<p><span class=\\\"s1\\\">- <\\/span>Research oriented \\u2013 you seek to understand model behavior, not just apply tools blindly<span class=\\\"Apple-converted-space\\\">&nbsp;<\\/span><\\/p>\\r\\n<p><span class=\\\"s1\\\">- <\\/span>Able to adapt quickly, and draw from a range of tools as needed<span class=\\\"Apple-converted-space\\\">&nbsp;<\\/span><\\/p>\\r\\n<p><span class=\\\"s1\\\">- <\\/span>Industry experience a plus<\\/p>\",\"6\":\"<p><strong>Responsibilities<\\/strong><\\/p>\\r\\n<p>You are equal parts researcher, information architect and hacker. You will communicate and collaborate with software engineers. You must enjoy developing creative solutions to difficult problems in an autonomous, startup environment with direct contact to top management and industry experts. You are passionate about innovating and enjoy independence to pursue designated goals.<\\/p>\",\"7\":\"<p><strong>You will:<\\/strong><\\/p>\\r\\n<p><span class=\\\"s1\\\">- <\\/span>Mine and analyze data pertaining to discover critical business insights<\\/p>\\r\\n<p><span class=\\\"s1\\\">- <\\/span>Generate ideas for new products, from directing high-level concept formation to prototyping<\\/p>\\r\\n<p><span class=\\\"s1\\\">- <\\/span>Synthesize research data, turning data to actionable insights and specific model requirements<span class=\\\"Apple-converted-space\\\">&nbsp;<\\/span><\\/p>\\r\\n<p><span class=\\\"s1\\\">- <\\/span>Quickly deploy out-of the-box solutions where possible, innovate when necessary<span class=\\\"Apple-converted-space\\\">&nbsp;<\\/span><\\/p>\\r\\n<p><span class=\\\"s1\\\">- <\\/span>Stay current with advancements in machine learning and advocate for the appropriate application of those advancements in our own products<span class=\\\"Apple-converted-space\\\">&nbsp;<\\/span><\\/p>\\r\\n<p><span class=\\\"s1\\\">- <\\/span>Work closely with engineers and production developers to ensure clear, effective communication within the team<span class=\\\"Apple-converted-space\\\">&nbsp;<\\/span><\\/p>\\r\\n<p><span class=\\\"s1\\\">- <\\/span>Occasionally develop short, optimized pieces of code<\\/p>\"}}', '2017-07-12 18:38:54', '2017-07-12 18:38:54', '192ad8e7-f139-446d-a0fb-5d2eee6ee089'),
(16, 14, 7, 1, 'en_us', 1, '', '{\"typeId\":\"8\",\"authorId\":\"1\",\"title\":\"Software Engineer\",\"slug\":\"software-engineer\",\"postDate\":1499884821,\"expiryDate\":null,\"enabled\":1,\"parentId\":\"\",\"fields\":{\"5\":\"<p><strong>About You<\\/strong><\\/p>\\r\\n<p>In this role, you will contribute towards building new functionality for our platform by applying what you know, learning new technologies and tools, and expanding your competence in multiple areas; you will contribute towards building and improving our current platform to help us fundamentally change the way an entire industry works.<\\/p>\",\"8\":\"<p><strong><\\/strong><strong>Desired Skills<\\/strong><\\/p>\\r\\n<p>The nature of your work calls for a unique mixture of skills. What is most important is that you are exceptional in what you do know, and have the desire and ability to learn new things quickly and build on your current set of skills.<\\/p>\\r\\n<p><strong>Required qualifications<\\/strong><\\/p>\\r\\n<p>- Currently pursuing a BS level or higher in CS or have an applicable background.<\\/p>\\r\\n<p>- Fluency in modern scripting languages, ideally Python.<\\/p>\\r\\n<p>- Experience with predictive analytics, algorithms, or machine learning, and at least one supporting technology stack (e.g., Spark, TensorFlow, sklearn).<\\/p>\\r\\n<p>- Ability to pay close attention to detail.<\\/p>\",\"6\":\"<p><strong>Responsibilities<\\/strong><\\/p>\\r\\n<p>You\\u2019ll contribute to any and all parts of our flow for developing and deploying high-volume predictive models: from data infrastructure to modeling engines and algorithms, to high-performance cloud computing interfaces, to client-facing BI\\/analytics.<span class=\\\"Apple-converted-space\\\">&nbsp;<\\/span><\\/p>\",\"7\":\"<p><strong>You will:<\\/strong><\\/p>\\r\\n<p><span class=\\\"s1\\\">- <\\/span>Assist Integration of predictive models into database-backed environments, real-time query APIs, and existing modeling pipelines, considering computational and other constraints.<\\/p>\\r\\n<p><span class=\\\"s1\\\">- <\\/span>Contribute to significant strategic projects focused on enhancements to core tooling, automation, scalability, and broad statistical machine learning capabilities.<\\/p>\\r\\n<p>- Collaborate with other team members, including machine learning researchers, database engineers and project managers, to design, generalize, optimize and implement predictive models and research.<\\/p>\"}}', '2017-07-12 18:40:21', '2017-07-12 18:40:21', 'ddd1fe7f-6adf-4fc6-9058-c322ebd969a1'),
(17, 15, 7, 1, 'en_us', 1, '', '{\"typeId\":\"8\",\"authorId\":\"1\",\"title\":\"Senior Software Engineer\",\"slug\":\"senior-software-engineer\",\"postDate\":1499885075,\"expiryDate\":null,\"enabled\":1,\"parentId\":\"\",\"fields\":{\"5\":\"<p><strong>About You<\\/strong><\\/p>\\r\\n<p>In this role, we are looking for someone who not only can contribute at a high level to make the best products for our clients. You will be given the freedom to maximize the potential of our existing products as well as create new features for our clients. You will be challenged and you will shape this business, and by extension, the way the industries we serve leverage data and predictive analytics. You will expand your competence and explore new technologies at the intersection of machine learning, engineering, and product delivery.<\\/p>\",\"8\":\"<p><strong>Desired Skills<\\/strong><\\/p>\\r\\n<p>The interdisciplinary nature of our work calls for an unusual mixture of skills that few may already possess. What is most important is that you are exceptional in what you do know, and have the desire, willingness, and ability to learn new things quickly and build upon your current set of skills.The ideal candidate will have some or all of the following qualifications:<\\/p>\\r\\n<p><span class=\\\"s1\\\">- <\\/span>BS\\/MS\\/PhD in CS, or equivalent experience and self-education.<\\/p>\\r\\n<p><span class=\\\"s1\\\">- <\\/span>Minimum of 5 years of experience in software engineering.<\\/p>\\r\\n<p><span class=\\\"s1\\\">- <\\/span>Experience as a software architect\\/lead architect.<\\/p>\\r\\n<p><span class=\\\"s1\\\">- <\\/span>Experience with predictive analytics, algorithms, or machine learning, and supporting stacks (e.g. Spark MLlib, TensorFlow, scikit-learn).<\\/p>\\r\\n<p><span class=\\\"s1\\\">- <\\/span>A working knowledge of SQL, and\\/or experience with non-relational\\/alternative databases.<\\/p>\\r\\n<p><span class=\\\"s1\\\">- <\\/span>Experience with a cloud-computing environment (e.g. Amazon EC2).<\\/p>\\r\\n<p><span class=\\\"s1\\\">- <\\/span>Experience with distributed computing frameworks (e.g. Apache Spark).<br><\\/p>\",\"6\":\"<p><strong>Responsibilities<\\/strong><\\/p>\\r\\n<p>You and your team will contribute to any and all parts of our flow for developing and deploying high-volume predictive models: from data infrastructure to modeling engines and algorithms, to high-performance cloud computing interfaces, to client-facing BI\\/analytics.<span class=\\\"Apple-converted-space\\\">&nbsp;<\\/span><\\/p>\",\"7\":\"<p><strong>You will:<\\/strong><\\/p>\\r\\n<p><span class=\\\"s1\\\">- <\\/span>Design, own and lead significant strategic projects focused on enhancements to core model tooling, automation, and scalability.<\\/p>\\r\\n<p><span class=\\\"s1\\\">- <\\/span>Build on our current vision and roadmap around platform strategy.<\\/p>\\r\\n<p><span class=\\\"s1\\\">- <\\/span>Scale and optimize existing pipelines, and advance process repeatability.<\\/p>\\r\\n<p><span class=\\\"s1\\\">- <\\/span>Collaborate with the research team members to translate research into practice.<\\/p>\\r\\n<p><span class=\\\"s1\\\">- <\\/span>Engineer effective systems to deploy products in a robust and scalable environment.<\\/p>\\r\\n<p><span class=\\\"s1\\\">- <\\/span>Design and build systems for end-to-end high throughput data handling, and integrate predictive models into database-backed environments, client-facing APIs, and existing modeling pipelines.<\\/p>\"}}', '2017-07-12 18:44:35', '2017-07-12 18:44:35', '4ae978cb-a0ff-443a-80ea-d959fa37342b'),
(18, 11, 6, 1, 'en_us', 2, '', '{\"typeId\":\"7\",\"authorId\":null,\"title\":\"Jobs\",\"slug\":\"jobs\",\"postDate\":1499884498,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":{\"3\":\"Come work with us!\",\"4\":\"We are looking for motivated, critical and creative thinkers to contribute to our team as software engineers. You will use what you have learned in class and be able to apply it alongside a team of engineers representing the best schools in the area. You are comfortable thinking outside the box across projects and use-cases. You are able to hit the ground running, independent, fast learner, comfortable within fast-paced, unstructured environment.Don\\u2019t see your position listed? We are always looking for talented and amazing people to join our team, please email us at jobs@gradientai.com.\"}}', '2017-07-12 18:46:04', '2017-07-12 18:46:04', '6c805507-25c4-4c95-85db-d5ff69d35d54'),
(19, 16, 4, 1, 'en_us', 1, NULL, '{\"typeId\":\"5\",\"authorId\":null,\"title\":\"Solutions\",\"slug\":\"solutions\",\"postDate\":1499891973,\"expiryDate\":null,\"enabled\":1,\"parentId\":null,\"fields\":[]}', '2017-07-12 20:39:34', '2017-07-12 20:39:34', 'a33f865c-64bf-4338-b9e4-b53b21859b43');

-- --------------------------------------------------------

--
-- Table structure for table `craft_fieldgroups`
--

CREATE TABLE `craft_fieldgroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_fieldgroups`
--

INSERT INTO `craft_fieldgroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'Default', '2017-07-12 16:27:08', '2017-07-12 16:27:08', '2d9ad09b-08d5-418e-b68d-1c752a48db54'),
(2, 'Job Posting', '2017-07-12 17:30:16', '2017-07-12 17:30:16', 'd757eebe-c0ba-4760-bed5-94d1165be9fc');

-- --------------------------------------------------------

--
-- Table structure for table `craft_fieldlayoutfields`
--

CREATE TABLE `craft_fieldlayoutfields` (
  `id` int(11) NOT NULL,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_fieldlayoutfields`
--

INSERT INTO `craft_fieldlayoutfields` (`id`, `layoutId`, `tabId`, `fieldId`, `required`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(2, 5, 2, 1, 1, 1, '2017-07-12 16:27:08', '2017-07-12 16:27:08', '54102563-fbbf-444e-b0be-3f7d347059ee'),
(3, 5, 2, 2, 0, 2, '2017-07-12 16:27:08', '2017-07-12 16:27:08', 'b22f2938-a365-47fc-b25e-2f371ff84160'),
(4, 7, 3, 1, 0, 1, '2017-07-12 16:33:52', '2017-07-12 16:33:52', '9000f486-0737-4e9f-8967-fa38d41360cb'),
(5, 8, 4, 1, 1, 1, '2017-07-12 17:24:04', '2017-07-12 17:24:04', 'a482710b-1ba5-4c3c-9dab-b949924abcaf'),
(6, 8, 4, 4, 0, 2, '2017-07-12 17:24:04', '2017-07-12 17:24:04', '6e80b636-d1f3-4602-8061-907a61c243c5'),
(7, 11, 5, 1, 0, 1, '2017-07-12 17:25:53', '2017-07-12 17:25:53', 'df227956-b1d1-43c1-8f49-35034a9dadc8'),
(8, 14, 6, 5, 0, 1, '2017-07-12 18:23:25', '2017-07-12 18:23:25', '114bb133-423a-41c2-a5ee-79e1190d21b3'),
(9, 14, 6, 6, 0, 2, '2017-07-12 18:23:25', '2017-07-12 18:23:25', 'e22f6aad-1af1-4113-8ccf-8e603d2ed884'),
(10, 14, 6, 7, 0, 3, '2017-07-12 18:23:25', '2017-07-12 18:23:25', '27988c4c-0c8e-460c-a53c-89a23ff5f568'),
(11, 14, 6, 8, 0, 4, '2017-07-12 18:23:25', '2017-07-12 18:23:25', '51b25bd6-31cc-4592-8a13-b378b60d4ea0'),
(12, 15, 7, 3, 0, 1, '2017-07-12 18:24:47', '2017-07-12 18:24:47', '5da4b850-904a-4e86-83d2-b58ac3c9e006'),
(13, 15, 7, 4, 0, 2, '2017-07-12 18:24:47', '2017-07-12 18:24:47', 'fd761cc7-a0f6-474b-8377-14b3c016fcbb'),
(14, 16, 8, 1, 0, 1, '2017-07-12 18:25:12', '2017-07-12 18:25:12', 'a1f630ff-d0d8-4d56-8951-ee8d57033bf1');

-- --------------------------------------------------------

--
-- Table structure for table `craft_fieldlayouts`
--

CREATE TABLE `craft_fieldlayouts` (
  `id` int(11) NOT NULL,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_fieldlayouts`
--

INSERT INTO `craft_fieldlayouts` (`id`, `type`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'Tag', '2017-07-12 16:27:08', '2017-07-12 16:27:08', '98c8c76c-5097-460b-97ba-0689005581b7'),
(5, 'Entry', '2017-07-12 16:27:08', '2017-07-12 16:27:08', 'c9d0aeba-4e26-4085-8192-02bb927a4d04'),
(7, 'Entry', '2017-07-12 16:33:52', '2017-07-12 16:33:52', '8cca5fa9-a995-43c5-9019-2670ad96d127'),
(8, 'Entry', '2017-07-12 17:24:04', '2017-07-12 17:24:04', '4841d9c9-9697-4623-a8db-94c6ad9017e7'),
(9, 'Entry', '2017-07-12 17:24:54', '2017-07-12 17:24:54', '12d7b07f-a998-41c3-bd43-b1780bfca7a4'),
(11, 'Entry', '2017-07-12 17:25:53', '2017-07-12 17:25:53', 'aacd002f-4bf9-4b77-bf96-c65a037940a4'),
(14, 'Entry', '2017-07-12 18:23:25', '2017-07-12 18:23:25', 'aa047a28-5ef9-479d-9533-1b51fcca7d31'),
(15, 'Entry', '2017-07-12 18:24:47', '2017-07-12 18:24:47', '03ddb29d-ed0f-4de3-9f34-e1a659d74eb3'),
(16, 'Entry', '2017-07-12 18:25:12', '2017-07-12 18:25:12', '7e825eab-e053-445b-a204-9c54a7461594');

-- --------------------------------------------------------

--
-- Table structure for table `craft_fieldlayouttabs`
--

CREATE TABLE `craft_fieldlayouttabs` (
  `id` int(11) NOT NULL,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_fieldlayouttabs`
--

INSERT INTO `craft_fieldlayouttabs` (`id`, `layoutId`, `name`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(2, 5, 'Content', 1, '2017-07-12 16:27:08', '2017-07-12 16:27:08', '790b8a22-e01b-47c2-9fd1-a07e80ffa140'),
(3, 7, 'Tab 1', 1, '2017-07-12 16:33:52', '2017-07-12 16:33:52', 'db633f94-b884-4102-859c-6bd9558db23b'),
(4, 8, 'Content', 1, '2017-07-12 17:24:04', '2017-07-12 17:24:04', 'b5f62b47-8cab-4b99-8d22-234254efa9d0'),
(5, 11, 'Tab 1', 1, '2017-07-12 17:25:53', '2017-07-12 17:25:53', '91c89933-1e14-4ed3-b6c1-6e3dfe7afca5'),
(6, 14, 'Tab 1', 1, '2017-07-12 18:23:25', '2017-07-12 18:23:25', '13742965-29b8-421e-b865-f3723fe4aa50'),
(7, 15, 'Tab 1', 1, '2017-07-12 18:24:47', '2017-07-12 18:24:47', '3e360955-268b-4c9e-90fb-de9e9ee15589'),
(8, 16, 'Tab 1', 1, '2017-07-12 18:25:12', '2017-07-12 18:25:12', '43c93eba-37bb-4a0b-af12-089240e6b6e0');

-- --------------------------------------------------------

--
-- Table structure for table `craft_fields`
--

CREATE TABLE `craft_fields` (
  `id` int(11) NOT NULL,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(58) COLLATE utf8_unicode_ci NOT NULL,
  `context` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'global',
  `instructions` text COLLATE utf8_unicode_ci,
  `translatable` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_fields`
--

INSERT INTO `craft_fields` (`id`, `groupId`, `name`, `handle`, `context`, `instructions`, `translatable`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'Body', 'body', 'global', NULL, 1, 'RichText', '{\"configFile\":\"Standard.json\",\"columnType\":\"text\"}', '2017-07-12 16:27:08', '2017-07-12 16:27:08', '2ef55da7-4418-463b-91cd-e767633580f7'),
(2, 1, 'Tags', 'tags', 'global', NULL, 0, 'Tags', '{\"source\":\"taggroup:1\"}', '2017-07-12 16:27:08', '2017-07-12 16:27:08', 'ade3d356-6ccf-4667-b8b9-11fe4a550aa9'),
(3, 1, 'Headline', 'headline', 'global', 'Page headline', 0, 'PlainText', '{\"placeholder\":\"Page Headline\",\"maxLength\":\"\",\"multiline\":\"1\",\"initialRows\":\"4\"}', '2017-07-12 17:19:13', '2017-07-12 17:19:13', '058dae21-e73c-45f8-aa85-c9eb33f93743'),
(4, 1, 'Lead Text', 'leadText', 'global', 'Lead text for page.', 0, 'PlainText', '{\"placeholder\":\"\",\"maxLength\":\"\",\"multiline\":\"1\",\"initialRows\":\"4\"}', '2017-07-12 17:19:39', '2017-07-12 17:19:39', '589e10fc-17f6-4d35-a390-19262bec2319'),
(5, 2, 'About you', 'aboutYou', 'global', 'What type of person should this candidate be?', 0, 'RichText', '{\"configFile\":\"\",\"availableAssetSources\":\"*\",\"availableTransforms\":\"*\",\"cleanupHtml\":\"1\",\"purifyHtml\":\"1\",\"purifierConfig\":\"\",\"columnType\":\"text\"}', '2017-07-12 17:31:05', '2017-07-12 17:31:05', 'b3c134b7-0145-4a24-899f-22099a5fbdc8'),
(6, 2, 'Responsibilities', 'responsibilities', 'global', 'What are the responsibilites for this job position?', 0, 'RichText', '{\"configFile\":\"\",\"availableAssetSources\":\"*\",\"availableTransforms\":\"*\",\"cleanupHtml\":\"1\",\"purifyHtml\":\"1\",\"purifierConfig\":\"\",\"columnType\":\"text\"}', '2017-07-12 17:31:50', '2017-07-12 17:31:50', 'e79e93b8-2ff5-4490-a9eb-926450697929'),
(7, 2, 'You will', 'youWill', 'global', 'What will this person be doing in this role?', 0, 'RichText', '{\"configFile\":\"\",\"availableAssetSources\":\"*\",\"availableTransforms\":\"*\",\"cleanupHtml\":\"1\",\"purifyHtml\":\"1\",\"purifierConfig\":\"\",\"columnType\":\"text\"}', '2017-07-12 17:32:06', '2017-07-12 17:32:06', 'f55ca90a-a0bc-4b28-8609-67ee6d56b012'),
(8, 2, 'Desired Skills', 'desiredSkills', 'global', 'What skills should this person possess?', 0, 'RichText', '{\"configFile\":\"\",\"availableAssetSources\":\"*\",\"availableTransforms\":\"*\",\"cleanupHtml\":\"1\",\"purifyHtml\":\"1\",\"purifierConfig\":\"\",\"columnType\":\"text\"}', '2017-07-12 17:32:30', '2017-07-12 17:32:30', '172a6b09-6eda-488f-90a4-91615930b773');

-- --------------------------------------------------------

--
-- Table structure for table `craft_globalsets`
--

CREATE TABLE `craft_globalsets` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(10) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_info`
--

CREATE TABLE `craft_info` (
  `id` int(11) NOT NULL,
  `version` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `edition` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `siteName` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `siteUrl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `timezone` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `on` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `maintenance` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_info`
--

INSERT INTO `craft_info` (`id`, `version`, `schemaVersion`, `edition`, `siteName`, `siteUrl`, `timezone`, `on`, `maintenance`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, '2.6.2983', '2.6.9', 0, 'gradient A.I.', 'http://localhost', 'UTC', 1, 0, '2017-07-12 16:27:03', '2017-07-12 16:27:03', '430ba9ec-da69-4c1d-9f6d-fe9aa32419e3');

-- --------------------------------------------------------

--
-- Table structure for table `craft_locales`
--

CREATE TABLE `craft_locales` (
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_locales`
--

INSERT INTO `craft_locales` (`locale`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`) VALUES
('en_us', 1, '2017-07-12 16:27:04', '2017-07-12 16:27:04', 'f609d04e-bf8d-4682-98d1-238cb106b864');

-- --------------------------------------------------------

--
-- Table structure for table `craft_matrixblocks`
--

CREATE TABLE `craft_matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `ownerLocale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_matrixblocktypes`
--

CREATE TABLE `craft_matrixblocktypes` (
  `id` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_migrations`
--

CREATE TABLE `craft_migrations` (
  `id` int(11) NOT NULL,
  `pluginId` int(11) DEFAULT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_migrations`
--

INSERT INTO `craft_migrations` (`id`, `pluginId`, `version`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, NULL, 'm000000_000000_base', '2017-07-12 16:27:04', '2017-07-12 16:27:04', '2017-07-12 16:27:04', 'c525447e-12ca-4f9f-a635-a47c7d56325d'),
(2, NULL, 'm140730_000001_add_filename_and_format_to_transformindex', '2017-07-12 16:27:04', '2017-07-12 16:27:04', '2017-07-12 16:27:04', '6ff38db0-e238-494f-a46c-65c70193584c'),
(3, NULL, 'm140815_000001_add_format_to_transforms', '2017-07-12 16:27:04', '2017-07-12 16:27:04', '2017-07-12 16:27:04', '274534bb-a45f-49b4-a510-4d9c4873da14'),
(4, NULL, 'm140822_000001_allow_more_than_128_items_per_field', '2017-07-12 16:27:04', '2017-07-12 16:27:04', '2017-07-12 16:27:04', '85bf84f7-2a50-431e-80bf-50a44d5c60a8'),
(5, NULL, 'm140829_000001_single_title_formats', '2017-07-12 16:27:04', '2017-07-12 16:27:04', '2017-07-12 16:27:04', '94581670-f894-4d4e-b05f-6ec9448c9ee3'),
(6, NULL, 'm140831_000001_extended_cache_keys', '2017-07-12 16:27:04', '2017-07-12 16:27:04', '2017-07-12 16:27:04', 'b5193041-879f-4338-a0e2-8acf79534aa9'),
(7, NULL, 'm140922_000001_delete_orphaned_matrix_blocks', '2017-07-12 16:27:04', '2017-07-12 16:27:04', '2017-07-12 16:27:04', 'f560944b-2d46-406e-b391-ff3abb4650d0'),
(8, NULL, 'm141008_000001_elements_index_tune', '2017-07-12 16:27:04', '2017-07-12 16:27:04', '2017-07-12 16:27:04', 'f3b04b93-c207-471d-9ce3-24a114387cc8'),
(9, NULL, 'm141009_000001_assets_source_handle', '2017-07-12 16:27:04', '2017-07-12 16:27:04', '2017-07-12 16:27:04', 'a1fb77a6-8693-4cb5-b299-d820fa33b205'),
(10, NULL, 'm141024_000001_field_layout_tabs', '2017-07-12 16:27:04', '2017-07-12 16:27:04', '2017-07-12 16:27:04', '2fc6e1df-71de-45a6-a65f-7285cbf67014'),
(11, NULL, 'm141030_000000_plugin_schema_versions', '2017-07-12 16:27:04', '2017-07-12 16:27:04', '2017-07-12 16:27:04', 'af10dbfd-b6c6-4ecc-b177-23e8c56888df'),
(12, NULL, 'm141030_000001_drop_structure_move_permission', '2017-07-12 16:27:04', '2017-07-12 16:27:04', '2017-07-12 16:27:04', '8bff0f96-49ea-48e2-8661-53648c95ce9b'),
(13, NULL, 'm141103_000001_tag_titles', '2017-07-12 16:27:04', '2017-07-12 16:27:04', '2017-07-12 16:27:04', 'b0972065-a10e-443b-b5dc-7d2c73f8b2a8'),
(14, NULL, 'm141109_000001_user_status_shuffle', '2017-07-12 16:27:04', '2017-07-12 16:27:04', '2017-07-12 16:27:04', 'e03da095-6a63-469f-b1b0-bac668a25e72'),
(15, NULL, 'm141126_000001_user_week_start_day', '2017-07-12 16:27:04', '2017-07-12 16:27:04', '2017-07-12 16:27:04', 'e64ff6fe-a9c8-4c14-8545-6f9b78f652cf'),
(16, NULL, 'm150210_000001_adjust_user_photo_size', '2017-07-12 16:27:04', '2017-07-12 16:27:04', '2017-07-12 16:27:04', '4616adb2-e0b8-4090-83e3-dd0fc25ed324'),
(17, NULL, 'm150724_000001_adjust_quality_settings', '2017-07-12 16:27:04', '2017-07-12 16:27:04', '2017-07-12 16:27:04', '571df7e4-bccc-4307-a9af-c609a741cf97'),
(18, NULL, 'm150827_000000_element_index_settings', '2017-07-12 16:27:04', '2017-07-12 16:27:04', '2017-07-12 16:27:04', 'c6f81214-b5ca-4567-a855-a603966be00e'),
(19, NULL, 'm150918_000001_add_colspan_to_widgets', '2017-07-12 16:27:04', '2017-07-12 16:27:04', '2017-07-12 16:27:04', 'cdc71200-55d7-47fc-9983-eacdd9c4939b'),
(20, NULL, 'm151007_000000_clear_asset_caches', '2017-07-12 16:27:04', '2017-07-12 16:27:04', '2017-07-12 16:27:04', 'bb397b05-0303-4d7c-8c47-ba7a9b1720fe'),
(21, NULL, 'm151109_000000_text_url_formats', '2017-07-12 16:27:04', '2017-07-12 16:27:04', '2017-07-12 16:27:04', '6a5e546d-2fcc-438c-b890-91c42bc547a2'),
(22, NULL, 'm151110_000000_move_logo', '2017-07-12 16:27:04', '2017-07-12 16:27:04', '2017-07-12 16:27:04', '50ed73e6-eed6-4671-af1b-9beb9eb07db7'),
(23, NULL, 'm151117_000000_adjust_image_widthheight', '2017-07-12 16:27:04', '2017-07-12 16:27:04', '2017-07-12 16:27:04', '17870fae-079c-41a4-832e-e6427e3031f6'),
(24, NULL, 'm151127_000000_clear_license_key_status', '2017-07-12 16:27:04', '2017-07-12 16:27:04', '2017-07-12 16:27:04', 'c4a3c567-a673-4c9e-ab7b-35244690d112'),
(25, NULL, 'm151127_000000_plugin_license_keys', '2017-07-12 16:27:04', '2017-07-12 16:27:04', '2017-07-12 16:27:04', '516c738e-d0a9-4276-8c1f-0ac501078de2'),
(26, NULL, 'm151130_000000_update_pt_widget_feeds', '2017-07-12 16:27:04', '2017-07-12 16:27:04', '2017-07-12 16:27:04', 'ef111c17-35bb-44e4-a4d6-3cf689300c5b'),
(27, NULL, 'm160114_000000_asset_sources_public_url_default_true', '2017-07-12 16:27:04', '2017-07-12 16:27:04', '2017-07-12 16:27:04', '084e4df8-c410-4349-bc94-ba3463d32d20'),
(28, NULL, 'm160223_000000_sortorder_to_smallint', '2017-07-12 16:27:04', '2017-07-12 16:27:04', '2017-07-12 16:27:04', '0bcecd76-c297-417a-8db1-857c8d44dfec'),
(29, NULL, 'm160229_000000_set_default_entry_statuses', '2017-07-12 16:27:04', '2017-07-12 16:27:04', '2017-07-12 16:27:04', '6c9859a7-2c45-4c0f-bf04-21f937fdf4de'),
(30, NULL, 'm160304_000000_client_permissions', '2017-07-12 16:27:04', '2017-07-12 16:27:04', '2017-07-12 16:27:04', 'd1cc30df-093c-47e7-b2be-b7872e2ed8b4'),
(31, NULL, 'm160322_000000_asset_filesize', '2017-07-12 16:27:04', '2017-07-12 16:27:04', '2017-07-12 16:27:04', '1f8ab8da-e7cd-40f5-85c0-b273140a3198'),
(32, NULL, 'm160503_000000_orphaned_fieldlayouts', '2017-07-12 16:27:04', '2017-07-12 16:27:04', '2017-07-12 16:27:04', '1404c5cc-ed48-49e8-8272-7e090d9f19e3'),
(33, NULL, 'm160510_000000_tasksettings', '2017-07-12 16:27:04', '2017-07-12 16:27:04', '2017-07-12 16:27:04', 'f72d1c67-086b-43a9-8344-ba5e6c6eee69'),
(34, NULL, 'm160829_000000_pending_user_content_cleanup', '2017-07-12 16:27:04', '2017-07-12 16:27:04', '2017-07-12 16:27:04', '90fd2b2f-86f9-42c2-9507-77b1dd638e1a'),
(35, NULL, 'm160830_000000_asset_index_uri_increase', '2017-07-12 16:27:04', '2017-07-12 16:27:04', '2017-07-12 16:27:04', '0aa6c1a2-0ed3-446d-9368-bb885ffa3c7f'),
(36, NULL, 'm160919_000000_usergroup_handle_title_unique', '2017-07-12 16:27:04', '2017-07-12 16:27:04', '2017-07-12 16:27:04', '88355766-b275-492e-9453-9d81ff117e4e'),
(37, NULL, 'm161108_000000_new_version_format', '2017-07-12 16:27:04', '2017-07-12 16:27:04', '2017-07-12 16:27:04', 'b945b542-724e-4b40-910a-2b0340eb6a7d'),
(38, NULL, 'm161109_000000_index_shuffle', '2017-07-12 16:27:04', '2017-07-12 16:27:04', '2017-07-12 16:27:04', 'a93a28de-79d8-4562-84ff-7734daa09f15');

-- --------------------------------------------------------

--
-- Table structure for table `craft_plugins`
--

CREATE TABLE `craft_plugins` (
  `id` int(11) NOT NULL,
  `class` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `licenseKey` char(24) COLLATE utf8_unicode_ci DEFAULT NULL,
  `licenseKeyStatus` enum('valid','invalid','mismatched','unknown') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `enabled` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `settings` text COLLATE utf8_unicode_ci,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_rackspaceaccess`
--

CREATE TABLE `craft_rackspaceaccess` (
  `id` int(11) NOT NULL,
  `connectionKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `storageUrl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cdnUrl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_relations`
--

CREATE TABLE `craft_relations` (
  `id` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceLocale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_routes`
--

CREATE TABLE `craft_routes` (
  `id` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `urlParts` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `urlPattern` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_searchindex`
--

CREATE TABLE `craft_searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fieldId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `keywords` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_searchindex`
--

INSERT INTO `craft_searchindex` (`elementId`, `attribute`, `fieldId`, `locale`, `keywords`) VALUES
(1, 'username', 0, 'en_us', ' gradientai '),
(1, 'firstname', 0, 'en_us', ''),
(1, 'lastname', 0, 'en_us', ''),
(1, 'fullname', 0, 'en_us', ''),
(1, 'email', 0, 'en_us', ' vendela j plus co '),
(1, 'slug', 0, 'en_us', ''),
(2, 'slug', 0, 'en_us', ' homepage '),
(2, 'title', 0, 'en_us', ' outperform your peers '),
(2, 'field', 1, 'en_us', ' a product focused predictive analytics group within milliman '),
(2, 'field', 4, 'en_us', ' insurance companies that efficiently leverage data outperform their peers we work with large real world datasets and apply advanced techniques spanning optimization statistics and artificial intelligence '),
(3, 'field', 1, 'en_us', ' craft is the cms that s powering localhost it s beautiful powerful flexible and easy to use and it s made by pixel tonic we can t wait to dive in and see what it s capable of this is even more captivating content which you couldn t see on the news index page because it was entered after a page break and the news index template only likes to show the content on the first page craft a nice alternative to word if you re making a website '),
(3, 'field', 2, 'en_us', ''),
(3, 'slug', 0, 'en_us', ' we just installed craft '),
(3, 'title', 0, 'en_us', ' we just installed craft '),
(4, 'field', 1, 'en_us', ' we use predictive data analytics to augment human intelligence give your team the right tools to uncover formerly hidden patterns underlying your large structured and unstructured datasets our goal is to help your business exceed the most important goals by taking a deeper look into your data to provide more accurate insights we work to improve your revenue and profitability by turning your most valuable asset your employees into your greatest competitive advantage '),
(4, 'slug', 0, 'en_us', ' power up your team '),
(4, 'title', 0, 'en_us', ' power up your team '),
(5, 'field', 1, 'en_us', ' patterns underlying big data are non linear machine learning to uncover these patterns has been historically underutilized within the insurance industry gradienta i has the solutions in place to deliver with uncompromising agility insurance companies that can effectively leverage the power of their data outperform their peers our product offering allows our customers to know more sooner '),
(5, 'slug', 0, 'en_us', ' understand the present and adapt to the future '),
(5, 'title', 0, 'en_us', ' understand the present and adapt to the future '),
(6, 'field', 1, 'en_us', ' at gradientai we re tackling some of the most challenging problems within the insurance and healthcare industry while leveraging advanced data analysis and machine intelligence you have the historical data and the deep understanding of the challenges our team will work with you to address these challenges using our product that prioritizes your needs we strive to establish a true partnership to help you get the most out of our products and engineering expertise '),
(6, 'slug', 0, 'en_us', ' your experience and our technology '),
(6, 'title', 0, 'en_us', ' your experience and our technology '),
(7, 'field', 1, 'en_us', ' join us on our mission to solve the most challenging problems in the healthcare and insurance industry at gradient a i talented and motivated successful startup veterans software engineers and data scientists representing the best schools in the country work together to deliver impactful products to our customers we work with large real world datasets and advanced techniques spanning artificial intelligence optimization and statistics our work has tangible impact our solutions enable data driven decisions that lead to improved financial performance for our customers as well as better treatment and outcomes for individuals come help us shape the future '),
(7, 'slug', 0, 'en_us', ' our team '),
(7, 'title', 0, 'en_us', ' our team '),
(8, 'field', 1, 'en_us', ' the gradient a i solution is aimed at solving a broad range of business problems starting with early identification of creeping catastrophic claims creeping cats while typically a small percentage of all non cat claims usually account for the majority of total losses companies following best practices tend to identify these larger loss claims miss the window of suggestibility that provides the adjuster with the greatest opportunity to positively influence claim outcome despite the drop in claim frequency the cost of claims in workers compensation is rising at rates similar to overall wage costs in addition to this accelerating cost curve frequency tends to pick up with an accelerating economy leading to even faster growth of costs a growing number of companies are taking advantage of the gradient a i s powerful suite of decision support solutions to help identify both the claims with the highest risk of cost and duration as well as identifying the most impactful intervention strategies that can have the greatest positive outcome at every point throughout the life of a claim with integrated reporting capabilities which combine all claims data through both internal and external systems our customers are provided with a comprehensive and accurate decision support platform '),
(8, 'slug', 0, 'en_us', ' workers comp '),
(8, 'title', 0, 'en_us', ' workers comp '),
(9, 'field', 1, 'en_us', ' gradient a i uses the most advanced machine learning based analytics to combine our clients data in tandem with big data from existing partnerships to provide improved risk selection and pricing a recent poll of 300 insurance companies suggested that on average each company is utilizing approximately 15% of their internal data put simply companies have a vast amount of data on hand but lack the necessary tools to take advantage of their existing data our capabilities increase the power of internal data by efficiently pulling together all internal data both structured and unstructured with external big data to overcome the issue of we don t have enough data the proof is in providing more accurate pricing and better performingpolicies the addition of integrated reporting provides accurate and timely analysis of business strategies and the ability to identify emerging opportunities to gain a competitive edge in the marketplace the gradient a i underwriting platform improves efficiency and reduces quote turnaround time including automated decision making support our learning based models constantly measure underwriting performance to identify changes in the underlying risks long before traditional approaches '),
(9, 'slug', 0, 'en_us', ' underwriting '),
(9, 'title', 0, 'en_us', ' underwriting '),
(10, 'field', 1, 'en_us', ' the gradient a i data warehouse leverages the latest artificial intelligence technologies to provide clients the fastest time to access data across all internal operational systems the process uses ai to gather client data from multiple sources deposit the data into the data warehouse and normalize the data in a single comprehensive data silo this platform allows clients to gain actionable insights into their data on a macro or micro level through the latest commercial business intelligence solutions such as tableau or power bi the breakthrough from gradient a i comes from applying machine learning capabilities on the data intake and normalization through our licensed adaptive learning engine the dca digital collection agent to eliminate the costly and time consuming efforts traditionally required to build and support an enterprise class data warehouse initiative this approach allows data intake and management to be handled internally efficiently without adding extra steps in the process for our clients the gradient a i data warehouse reduces time cost and resources required for our clients while empowering them with powerful results that had been eluding them prior to having access to the gradient a i data warehouse '),
(10, 'slug', 0, 'en_us', ' data warehouse '),
(10, 'title', 0, 'en_us', ' data warehouse '),
(11, 'slug', 0, 'en_us', ' jobs '),
(11, 'title', 0, 'en_us', ' jobs '),
(12, 'field', 1, 'en_us', ' equal opportunity employer protected veterans individuals with disabilities the contractor will not discharge or in any other manner discriminate against employees or applicants because they have inquired about discussed or disclosed their own pay or the pay of another employee or applicant however employees who have access to the compensation information of other employees or applicants as a part of their essential job functions cannot disclose the pay of other employees or applicants to individuals who do not otherwise have access to compensation information unless the disclosure is a in response to a formal complaint or charge b in furtherance of an investigation proceeding hearing or action including an investigation conducted by the employer or c consistent with the contractor s legal duty to furnish information '),
(12, 'slug', 0, 'en_us', ' equal opportunities '),
(12, 'title', 0, 'en_us', ' equal opportunities '),
(11, 'field', 3, 'en_us', ' come work with us '),
(11, 'field', 4, 'en_us', ' we are looking for motivated critical and creative thinkers to contribute to our team as software engineers you will use what you have learned in class and be able to apply it alongside a team of engineers representing the best schools in the area you are comfortable thinking outside the box across projects and use cases you are able to hit the ground running independent fast learner comfortable within fast paced unstructured environment don t see your position listed we are always looking for talented and amazing people to join our team please email us at jobs gradientai com '),
(13, 'field', 5, 'en_us', ' about you we are seeking talented data scientists to join our data modeling team this position will help define how our products will evolve by working closely with engineers to rapidly prototype new features and complementary products delivering our customers actionable intelligence from large data sets the role involves research as well as software implementations of machine learning prototypes and experiments data scientists are required to be able to understand user needs through interaction with client facing staff architect solutions and shepherd products through prototype phase requirements will be vague iterations will be rapid and we seek researchers who are nimble and willing to take smart risks bs ms to ph d levels available '),
(13, 'field', 6, 'en_us', ' responsibilities you are equal parts researcher information architect and hacker you will communicate and collaborate with software engineers you must enjoy developing creative solutions to difficult problems in an autonomous startup environment with direct contact to top management and industry experts you are passionate about innovating and enjoy independence to pursue designated goals '),
(13, 'field', 7, 'en_us', ' you will mine and analyze data pertaining to discover critical business insights generate ideas for new products from directing high level concept formation to prototyping synthesize research data turning data to actionable insights and specific model requirements quickly deploy out of the box solutions where possible innovate when necessary stay current with advancements in machine learning and advocate for the appropriate application of those advancements in our own products work closely with engineers and production developers to ensure clear effective communication within the team occasionally develop short optimized pieces of code '),
(13, 'field', 8, 'en_us', ' desired skills the interdisciplinary nature of our work calls for an unusual mixture of skills that few may already possess what is most important is that you are exceptional in what you do know and have the desire willingness and ability to learn new things quickly and build upon your current set of skills the ideal candidate will have some or all of the following qualifications machine learning and or statistics coursework familiarity with recent large scale machine learning tools e g tensorflow torch spark hadoop a plus but not required familiarity with a modern scripting language like python database experience sql a plus but not required research oriented you seek to understand model behavior not just apply tools blindly able to adapt quickly and draw from a range of tools as needed industry experience a plus '),
(13, 'slug', 0, 'en_us', ' data scientist '),
(13, 'title', 0, 'en_us', ' data scientist '),
(14, 'field', 5, 'en_us', ' about you in this role you will contribute towards building new functionality for our platform by applying what you know learning new technologies and tools and expanding your competence in multiple areas you will contribute towards building and improving our current platform to help us fundamentally change the way an entire industry works '),
(14, 'field', 6, 'en_us', ' responsibilities you ll contribute to any and all parts of our flow for developing and deploying high volume predictive models from data infrastructure to modeling engines and algorithms to high performance cloud computing interfaces to client facing bi analytics '),
(14, 'field', 7, 'en_us', ' you will assist integration of predictive models into database backed environments real time query apis and existing modeling pipelines considering computational and other constraints contribute to significant strategic projects focused on enhancements to core tooling automation scalability and broad statistical machine learning capabilities collaborate with other team members including machine learning researchers database engineers and project managers to design generalize optimize and implement predictive models and research '),
(14, 'field', 8, 'en_us', ' desired skills the nature of your work calls for a unique mixture of skills what is most important is that you are exceptional in what you do know and have the desire and ability to learn new things quickly and build on your current set of skills required qualifications currently pursuing a bs level or higher in cs or have an applicable background fluency in modern scripting languages ideally python experience with predictive analytics algorithms or machine learning and at least one supporting technology stack e g spark tensorflow sklearn ability to pay close attention to detail '),
(14, 'slug', 0, 'en_us', ' software engineer '),
(14, 'title', 0, 'en_us', ' software engineer '),
(15, 'field', 5, 'en_us', ' about you in this role we are looking for someone who not only can contribute at a high level to make the best products for our clients you will be given the freedom to maximize the potential of our existing products as well as create new features for our clients you will be challenged and you will shape this business and by extension the way the industries we serve leverage data and predictive analytics you will expand your competence and explore new technologies at the intersection of machine learning engineering and product delivery '),
(15, 'field', 6, 'en_us', ' responsibilities you and your team will contribute to any and all parts of our flow for developing and deploying high volume predictive models from data infrastructure to modeling engines and algorithms to high performance cloud computing interfaces to client facing bi analytics '),
(15, 'field', 7, 'en_us', ' you will design own and lead significant strategic projects focused on enhancements to core model tooling automation and scalability build on our current vision and roadmap around platform strategy scale and optimize existing pipelines and advance process repeatability collaborate with the research team members to translate research into practice engineer effective systems to deploy products in a robust and scalable environment design and build systems for end to end high throughput data handling and integrate predictive models into database backed environments client facing apis and existing modeling pipelines '),
(15, 'field', 8, 'en_us', ' desired skills the interdisciplinary nature of our work calls for an unusual mixture of skills that few may already possess what is most important is that you are exceptional in what you do know and have the desire willingness and ability to learn new things quickly and build upon your current set of skills the ideal candidate will have some or all of the following qualifications bs ms phd in cs or equivalent experience and self education minimum of 5 years of experience in software engineering experience as a software architect lead architect experience with predictive analytics algorithms or machine learning and supporting stacks e g spark mllib tensorflow scikit learn a working knowledge of sql and or experience with non relational alternative databases experience with a cloud computing environment e g amazon ec2 experience with distributed computing frameworks e g apache spark '),
(15, 'slug', 0, 'en_us', ' senior software engineer '),
(15, 'title', 0, 'en_us', ' senior software engineer '),
(16, 'slug', 0, 'en_us', ' solutions '),
(16, 'title', 0, 'en_us', ' solutions ');

-- --------------------------------------------------------

--
-- Table structure for table `craft_sections`
--

CREATE TABLE `craft_sections` (
  `id` int(11) NOT NULL,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('single','channel','structure') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'channel',
  `hasUrls` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enableVersioning` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_sections`
--

INSERT INTO `craft_sections` (`id`, `structureId`, `name`, `handle`, `type`, `hasUrls`, `template`, `enableVersioning`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, NULL, 'Homepage', 'homepage', 'single', 1, 'index', 1, '2017-07-12 16:27:08', '2017-07-12 16:27:08', 'fab17d8d-0790-4058-8747-b039e4ee9e95'),
(2, NULL, 'News', 'news', 'channel', 1, 'news/_entry', 1, '2017-07-12 16:27:08', '2017-07-12 16:27:08', '8c3c5372-bac5-4fea-b667-caee8a45bd79'),
(3, 1, 'Hompage Content', 'hompageContent', 'structure', 0, NULL, 1, '2017-07-12 16:33:17', '2017-07-12 16:33:17', '9fb55607-0a41-4110-9026-acd3c88fffe9'),
(4, NULL, 'Solutions', 'solutions', 'single', 1, 'solutions/', 1, '2017-07-12 17:24:54', '2017-07-12 20:39:33', '243078ab-2e09-4c54-a85c-7ad5365adfa7'),
(5, NULL, 'Solutions Content', 'solutionsContent', 'channel', 0, NULL, 1, '2017-07-12 17:25:10', '2017-07-12 17:25:10', 'e615cd1f-4a29-42a8-8957-6fa3906ae01d'),
(6, NULL, 'Jobs', 'jobs', 'single', 1, 'jobs/', 1, '2017-07-12 18:22:18', '2017-07-12 18:34:58', '16414537-2398-4c16-9bcd-f21668feaccf'),
(7, 4, 'Job Postings', 'jobPostings', 'structure', 1, 'job-postings/_entry', 1, '2017-07-12 18:22:56', '2017-07-12 18:22:56', 'dbc68be3-2804-4d2c-b0fa-c644880d5686');

-- --------------------------------------------------------

--
-- Table structure for table `craft_sections_i18n`
--

CREATE TABLE `craft_sections_i18n` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `enabledByDefault` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `urlFormat` text COLLATE utf8_unicode_ci,
  `nestedUrlFormat` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_sections_i18n`
--

INSERT INTO `craft_sections_i18n` (`id`, `sectionId`, `locale`, `enabledByDefault`, `urlFormat`, `nestedUrlFormat`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'en_us', 1, '__home__', NULL, '2017-07-12 16:27:08', '2017-07-12 16:27:08', '7af53a19-e279-41f3-9688-582e79160fde'),
(2, 2, 'en_us', 1, 'news/{postDate.year}/{slug}', NULL, '2017-07-12 16:27:08', '2017-07-12 16:27:08', '551b95e9-0cf4-410f-b3a2-00c7fa9f96cb'),
(3, 3, 'en_us', 1, NULL, NULL, '2017-07-12 16:33:17', '2017-07-12 16:33:17', 'ce1b15f2-3d9e-4699-8f7e-350d85948934'),
(4, 4, 'en_us', 1, 'solutions', NULL, '2017-07-12 17:24:54', '2017-07-12 20:39:33', 'a5534f37-6c0e-4c06-bf6f-714467753574'),
(5, 5, 'en_us', 1, NULL, NULL, '2017-07-12 17:25:10', '2017-07-12 17:25:10', '629c2b9e-e427-4dbf-817d-33e7583b9950'),
(6, 6, 'en_us', 1, 'jobs', NULL, '2017-07-12 18:22:18', '2017-07-12 18:22:37', 'bc8155ec-3fa3-4331-ba6f-4e7d0ee3cd05'),
(7, 7, 'en_us', 1, 'job-postings/{slug}', '{parent.uri}/{slug}', '2017-07-12 18:22:56', '2017-07-12 18:22:56', 'd3ccf92b-317c-4596-9cce-fe537a63b981');

-- --------------------------------------------------------

--
-- Table structure for table `craft_sessions`
--

CREATE TABLE `craft_sessions` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `token` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_sessions`
--

INSERT INTO `craft_sessions` (`id`, `userId`, `token`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, '0098a8c7adafd2f1318e3b8df1ffa93a05b122e7czozMjoiTklxR3NsNU1QeVZlb0wzSkdxY3lQSDlPWVMwS19GYnMiOw==', '2017-07-12 16:27:08', '2017-07-12 16:27:08', 'f310c825-e07d-4a1f-ab4e-906c84d26be0'),
(2, 1, '3d0a296dc58a30fe066d114aada0b1f3fa7ba65dczozMjoidlY4ek9XVGQ5bVQ5cHpoVV91RHRCWThUblZwcUtSdHkiOw==', '2017-07-12 18:21:30', '2017-07-12 18:21:30', 'e18faa3c-59ff-425a-a073-3cfc81ff90bc'),
(3, 1, '0378c92c96331d7c26127fed0c386f8e50a96a49czozMjoiSERMVmgxVjhSZ1FFODFNZ2luZ19KVWlmcXRwSnMyaHYiOw==', '2017-07-12 20:26:59', '2017-07-12 20:26:59', 'ea705ec8-3643-4d90-986d-782e6eafe0cc'),
(4, 1, 'b55bbdf14d940559fc67f3148fc0e9b24e1a9ccaczozMjoieTNRSzRXcnVoVGhLUVpGc3pCX0dvQk4yR0RoZ21RQ2wiOw==', '2017-07-15 13:46:38', '2017-07-15 13:46:38', 'db385f80-e581-4704-bf74-5f29ef44ac8f'),
(5, 1, 'a0615b9f61460a289b8f0482910c72f705ee23f1czozMjoiR34zNn5xelFKRmd3Nk9Nd1p5RE5BbmRQVVZJQ3JneVgiOw==', '2017-07-21 17:00:32', '2017-07-21 17:00:32', '5f082567-863f-4613-93f2-f0bff7e0c8b7');

-- --------------------------------------------------------

--
-- Table structure for table `craft_shunnedmessages`
--

CREATE TABLE `craft_shunnedmessages` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_structureelements`
--

CREATE TABLE `craft_structureelements` (
  `id` int(11) NOT NULL,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) UNSIGNED DEFAULT NULL,
  `lft` int(11) UNSIGNED NOT NULL,
  `rgt` int(11) UNSIGNED NOT NULL,
  `level` smallint(6) UNSIGNED NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_structureelements`
--

INSERT INTO `craft_structureelements` (`id`, `structureId`, `elementId`, `root`, `lft`, `rgt`, `level`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, NULL, 1, 1, 10, 0, '2017-07-12 16:35:14', '2017-07-12 16:35:14', '88bd6aae-6c60-4eae-be02-ef0f1e860cd2'),
(2, 1, 4, 1, 2, 3, 1, '2017-07-12 16:35:14', '2017-07-12 16:35:14', 'f8d092a4-0a78-402e-b5d0-733c9da589b5'),
(3, 1, 5, 1, 4, 5, 1, '2017-07-12 17:21:16', '2017-07-12 17:21:16', '8dde07d3-d93a-444c-a482-00aa062e55cf'),
(4, 1, 6, 1, 6, 7, 1, '2017-07-12 17:22:09', '2017-07-12 17:22:09', '5452e051-5227-4a51-865e-e1bbc893bc04'),
(5, 1, 7, 1, 8, 9, 1, '2017-07-12 17:22:39', '2017-07-12 17:22:39', '2dd4f0f2-3987-4d87-a8ca-3825db192837'),
(6, 4, NULL, 6, 1, 10, 0, '2017-07-12 18:33:57', '2017-07-12 18:33:57', '8c8f5f8d-c8ac-49dd-b953-4d7de8f19b6f'),
(7, 4, 12, 6, 2, 3, 1, '2017-07-12 18:33:57', '2017-07-12 18:33:57', '24266de4-d18e-4271-8e11-d6144c12f9b1'),
(8, 4, 13, 6, 8, 9, 1, '2017-07-12 18:38:54', '2017-07-12 18:38:54', '80d0e2a7-f792-4b66-9867-da2d73fd52c4'),
(9, 4, 14, 6, 6, 7, 1, '2017-07-12 18:40:21', '2017-07-12 18:40:21', 'ac139805-081f-41f1-babd-3f81e079688c'),
(10, 4, 15, 6, 4, 5, 1, '2017-07-12 18:44:35', '2017-07-12 18:44:35', 'e4917bd3-4145-448e-80fb-c99b69f8f24e');

-- --------------------------------------------------------

--
-- Table structure for table `craft_structures`
--

CREATE TABLE `craft_structures` (
  `id` int(11) NOT NULL,
  `maxLevels` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_structures`
--

INSERT INTO `craft_structures` (`id`, `maxLevels`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, NULL, '2017-07-12 16:33:17', '2017-07-12 16:33:17', '2865eac0-fd55-4dd1-a8be-044987d47af5'),
(4, NULL, '2017-07-12 18:22:56', '2017-07-12 18:22:56', '47f6397a-1ce4-456f-a470-f64c12f0cd93');

-- --------------------------------------------------------

--
-- Table structure for table `craft_systemsettings`
--

CREATE TABLE `craft_systemsettings` (
  `id` int(11) NOT NULL,
  `category` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_systemsettings`
--

INSERT INTO `craft_systemsettings` (`id`, `category`, `settings`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'email', '{\"protocol\":\"php\",\"emailAddress\":\"vendela@j-plus.co\",\"senderName\":\"gradient A.I.\"}', '2017-07-12 16:27:08', '2017-07-12 16:27:08', '31731e23-3d32-46ac-ba7c-14586e35c4a9');

-- --------------------------------------------------------

--
-- Table structure for table `craft_taggroups`
--

CREATE TABLE `craft_taggroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(10) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_taggroups`
--

INSERT INTO `craft_taggroups` (`id`, `name`, `handle`, `fieldLayoutId`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'Default', 'default', 1, '2017-07-12 16:27:08', '2017-07-12 16:27:08', '35f0136a-0916-4d60-8acd-1911cfab3f52');

-- --------------------------------------------------------

--
-- Table structure for table `craft_tags`
--

CREATE TABLE `craft_tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_tasks`
--

CREATE TABLE `craft_tasks` (
  `id` int(11) NOT NULL,
  `root` int(11) UNSIGNED DEFAULT NULL,
  `lft` int(11) UNSIGNED NOT NULL,
  `rgt` int(11) UNSIGNED NOT NULL,
  `level` smallint(6) UNSIGNED NOT NULL,
  `currentStep` int(11) UNSIGNED DEFAULT NULL,
  `totalSteps` int(11) UNSIGNED DEFAULT NULL,
  `status` enum('pending','error','running') COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `settings` mediumtext COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_templatecachecriteria`
--

CREATE TABLE `craft_templatecachecriteria` (
  `id` int(11) NOT NULL,
  `cacheId` int(11) NOT NULL,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `criteria` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_templatecacheelements`
--

CREATE TABLE `craft_templatecacheelements` (
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_templatecaches`
--

CREATE TABLE `craft_templatecaches` (
  `id` int(11) NOT NULL,
  `cacheKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `locale` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_tokens`
--

CREATE TABLE `craft_tokens` (
  `id` int(11) NOT NULL,
  `token` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `route` text COLLATE utf8_unicode_ci,
  `usageLimit` tinyint(3) UNSIGNED DEFAULT NULL,
  `usageCount` tinyint(3) UNSIGNED DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_usergroups`
--

CREATE TABLE `craft_usergroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_usergroups_users`
--

CREATE TABLE `craft_usergroups_users` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_userpermissions`
--

CREATE TABLE `craft_userpermissions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_userpermissions_usergroups`
--

CREATE TABLE `craft_userpermissions_usergroups` (
  `id` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_userpermissions_users`
--

CREATE TABLE `craft_userpermissions_users` (
  `id` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `craft_users`
--

CREATE TABLE `craft_users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `photo` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `preferredLocale` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `weekStartDay` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `admin` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `client` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `locked` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `suspended` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `pending` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `archived` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIPAddress` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(4) UNSIGNED DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `verificationCode` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passwordResetRequired` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_users`
--

INSERT INTO `craft_users` (`id`, `username`, `photo`, `firstName`, `lastName`, `email`, `password`, `preferredLocale`, `weekStartDay`, `admin`, `client`, `locked`, `suspended`, `pending`, `archived`, `lastLoginDate`, `lastLoginAttemptIPAddress`, `invalidLoginWindowStart`, `invalidLoginCount`, `lastInvalidLoginDate`, `lockoutDate`, `verificationCode`, `verificationCodeIssuedDate`, `unverifiedEmail`, `passwordResetRequired`, `lastPasswordChangeDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'gradientai', NULL, NULL, NULL, 'vendela@j-plus.co', '$2y$13$iwet7HZJnE.y0IPzpiXvnufkg1bChlRBs7Iv5ahddYkvxL.lPFC4G', NULL, 0, 1, 0, 0, 0, 0, 0, '2017-07-21 17:00:32', '::1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2017-07-12 16:27:05', '2017-07-12 16:27:05', '2017-07-21 17:00:32', '52fc046e-e922-4f9a-bfa4-a93be2f7a075');

-- --------------------------------------------------------

--
-- Table structure for table `craft_widgets`
--

CREATE TABLE `craft_widgets` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `type` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `colspan` tinyint(4) UNSIGNED DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `enabled` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `craft_widgets`
--

INSERT INTO `craft_widgets` (`id`, `userId`, `type`, `sortOrder`, `colspan`, `settings`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'RecentEntries', 1, NULL, NULL, 1, '2017-07-12 16:27:13', '2017-07-12 16:27:13', 'b027f24f-c816-40e2-80a5-0a291a3520c9'),
(2, 1, 'GetHelp', 2, NULL, NULL, 1, '2017-07-12 16:27:13', '2017-07-12 16:27:13', '1943e7ab-2780-44f4-a645-7a05c2e7a57c'),
(3, 1, 'Updates', 3, NULL, NULL, 1, '2017-07-12 16:27:13', '2017-07-12 16:27:13', 'ecdbec5d-1382-4e09-9c8b-96856e8038ca'),
(4, 1, 'Feed', 4, NULL, '{\"url\":\"https:\\/\\/craftcms.com\\/news.rss\",\"title\":\"Craft News\"}', 1, '2017-07-12 16:27:13', '2017-07-12 16:27:13', '7b830384-7cee-40c7-bdb1-7ab466af3217');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `craft_assetfiles`
--
ALTER TABLE `craft_assetfiles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_assetfiles_filename_folderId_unq_idx` (`filename`,`folderId`),
  ADD KEY `craft_assetfiles_sourceId_fk` (`sourceId`),
  ADD KEY `craft_assetfiles_folderId_fk` (`folderId`);

--
-- Indexes for table `craft_assetfolders`
--
ALTER TABLE `craft_assetfolders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_assetfolders_name_parentId_sourceId_unq_idx` (`name`,`parentId`,`sourceId`),
  ADD KEY `craft_assetfolders_parentId_fk` (`parentId`),
  ADD KEY `craft_assetfolders_sourceId_fk` (`sourceId`);

--
-- Indexes for table `craft_assetindexdata`
--
ALTER TABLE `craft_assetindexdata`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_assetindexdata_sessionId_sourceId_offset_unq_idx` (`sessionId`,`sourceId`,`offset`),
  ADD KEY `craft_assetindexdata_sourceId_fk` (`sourceId`);

--
-- Indexes for table `craft_assetsources`
--
ALTER TABLE `craft_assetsources`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_assetsources_name_unq_idx` (`name`),
  ADD UNIQUE KEY `craft_assetsources_handle_unq_idx` (`handle`),
  ADD KEY `craft_assetsources_fieldLayoutId_fk` (`fieldLayoutId`);

--
-- Indexes for table `craft_assettransformindex`
--
ALTER TABLE `craft_assettransformindex`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_assettransformindex_sourceId_fileId_location_idx` (`sourceId`,`fileId`,`location`);

--
-- Indexes for table `craft_assettransforms`
--
ALTER TABLE `craft_assettransforms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_assettransforms_name_unq_idx` (`name`),
  ADD UNIQUE KEY `craft_assettransforms_handle_unq_idx` (`handle`);

--
-- Indexes for table `craft_categories`
--
ALTER TABLE `craft_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_categories_groupId_fk` (`groupId`);

--
-- Indexes for table `craft_categorygroups`
--
ALTER TABLE `craft_categorygroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_categorygroups_name_unq_idx` (`name`),
  ADD UNIQUE KEY `craft_categorygroups_handle_unq_idx` (`handle`),
  ADD KEY `craft_categorygroups_structureId_fk` (`structureId`),
  ADD KEY `craft_categorygroups_fieldLayoutId_fk` (`fieldLayoutId`);

--
-- Indexes for table `craft_categorygroups_i18n`
--
ALTER TABLE `craft_categorygroups_i18n`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_categorygroups_i18n_groupId_locale_unq_idx` (`groupId`,`locale`),
  ADD KEY `craft_categorygroups_i18n_locale_fk` (`locale`);

--
-- Indexes for table `craft_content`
--
ALTER TABLE `craft_content`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_content_elementId_locale_unq_idx` (`elementId`,`locale`),
  ADD KEY `craft_content_title_idx` (`title`),
  ADD KEY `craft_content_locale_fk` (`locale`);

--
-- Indexes for table `craft_deprecationerrors`
--
ALTER TABLE `craft_deprecationerrors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_deprecationerrors_key_fingerprint_unq_idx` (`key`,`fingerprint`);

--
-- Indexes for table `craft_elementindexsettings`
--
ALTER TABLE `craft_elementindexsettings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_elementindexsettings_type_unq_idx` (`type`);

--
-- Indexes for table `craft_elements`
--
ALTER TABLE `craft_elements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_elements_type_idx` (`type`),
  ADD KEY `craft_elements_enabled_idx` (`enabled`),
  ADD KEY `craft_elements_archived_dateCreated_idx` (`archived`,`dateCreated`);

--
-- Indexes for table `craft_elements_i18n`
--
ALTER TABLE `craft_elements_i18n`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_elements_i18n_elementId_locale_unq_idx` (`elementId`,`locale`),
  ADD UNIQUE KEY `craft_elements_i18n_uri_locale_unq_idx` (`uri`,`locale`),
  ADD KEY `craft_elements_i18n_slug_locale_idx` (`slug`,`locale`),
  ADD KEY `craft_elements_i18n_enabled_idx` (`enabled`),
  ADD KEY `craft_elements_i18n_locale_fk` (`locale`);

--
-- Indexes for table `craft_emailmessages`
--
ALTER TABLE `craft_emailmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_emailmessages_key_locale_unq_idx` (`key`,`locale`),
  ADD KEY `craft_emailmessages_locale_fk` (`locale`);

--
-- Indexes for table `craft_entries`
--
ALTER TABLE `craft_entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_entries_sectionId_idx` (`sectionId`),
  ADD KEY `craft_entries_typeId_idx` (`typeId`),
  ADD KEY `craft_entries_postDate_idx` (`postDate`),
  ADD KEY `craft_entries_expiryDate_idx` (`expiryDate`),
  ADD KEY `craft_entries_authorId_fk` (`authorId`);

--
-- Indexes for table `craft_entrydrafts`
--
ALTER TABLE `craft_entrydrafts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_entrydrafts_entryId_locale_idx` (`entryId`,`locale`),
  ADD KEY `craft_entrydrafts_sectionId_fk` (`sectionId`),
  ADD KEY `craft_entrydrafts_creatorId_fk` (`creatorId`),
  ADD KEY `craft_entrydrafts_locale_fk` (`locale`);

--
-- Indexes for table `craft_entrytypes`
--
ALTER TABLE `craft_entrytypes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_entrytypes_name_sectionId_unq_idx` (`name`,`sectionId`),
  ADD UNIQUE KEY `craft_entrytypes_handle_sectionId_unq_idx` (`handle`,`sectionId`),
  ADD KEY `craft_entrytypes_sectionId_fk` (`sectionId`),
  ADD KEY `craft_entrytypes_fieldLayoutId_fk` (`fieldLayoutId`);

--
-- Indexes for table `craft_entryversions`
--
ALTER TABLE `craft_entryversions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_entryversions_entryId_locale_idx` (`entryId`,`locale`),
  ADD KEY `craft_entryversions_sectionId_fk` (`sectionId`),
  ADD KEY `craft_entryversions_creatorId_fk` (`creatorId`),
  ADD KEY `craft_entryversions_locale_fk` (`locale`);

--
-- Indexes for table `craft_fieldgroups`
--
ALTER TABLE `craft_fieldgroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_fieldgroups_name_unq_idx` (`name`);

--
-- Indexes for table `craft_fieldlayoutfields`
--
ALTER TABLE `craft_fieldlayoutfields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_fieldlayoutfields_layoutId_fieldId_unq_idx` (`layoutId`,`fieldId`),
  ADD KEY `craft_fieldlayoutfields_sortOrder_idx` (`sortOrder`),
  ADD KEY `craft_fieldlayoutfields_tabId_fk` (`tabId`),
  ADD KEY `craft_fieldlayoutfields_fieldId_fk` (`fieldId`);

--
-- Indexes for table `craft_fieldlayouts`
--
ALTER TABLE `craft_fieldlayouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_fieldlayouts_type_idx` (`type`);

--
-- Indexes for table `craft_fieldlayouttabs`
--
ALTER TABLE `craft_fieldlayouttabs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_fieldlayouttabs_sortOrder_idx` (`sortOrder`),
  ADD KEY `craft_fieldlayouttabs_layoutId_fk` (`layoutId`);

--
-- Indexes for table `craft_fields`
--
ALTER TABLE `craft_fields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_fields_handle_context_unq_idx` (`handle`,`context`),
  ADD KEY `craft_fields_context_idx` (`context`),
  ADD KEY `craft_fields_groupId_fk` (`groupId`);

--
-- Indexes for table `craft_globalsets`
--
ALTER TABLE `craft_globalsets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_globalsets_name_unq_idx` (`name`),
  ADD UNIQUE KEY `craft_globalsets_handle_unq_idx` (`handle`),
  ADD KEY `craft_globalsets_fieldLayoutId_fk` (`fieldLayoutId`);

--
-- Indexes for table `craft_info`
--
ALTER TABLE `craft_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `craft_locales`
--
ALTER TABLE `craft_locales`
  ADD PRIMARY KEY (`locale`),
  ADD KEY `craft_locales_sortOrder_idx` (`sortOrder`);

--
-- Indexes for table `craft_matrixblocks`
--
ALTER TABLE `craft_matrixblocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_matrixblocks_ownerId_idx` (`ownerId`),
  ADD KEY `craft_matrixblocks_fieldId_idx` (`fieldId`),
  ADD KEY `craft_matrixblocks_typeId_idx` (`typeId`),
  ADD KEY `craft_matrixblocks_sortOrder_idx` (`sortOrder`),
  ADD KEY `craft_matrixblocks_ownerLocale_fk` (`ownerLocale`);

--
-- Indexes for table `craft_matrixblocktypes`
--
ALTER TABLE `craft_matrixblocktypes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_matrixblocktypes_name_fieldId_unq_idx` (`name`,`fieldId`),
  ADD UNIQUE KEY `craft_matrixblocktypes_handle_fieldId_unq_idx` (`handle`,`fieldId`),
  ADD KEY `craft_matrixblocktypes_fieldId_fk` (`fieldId`),
  ADD KEY `craft_matrixblocktypes_fieldLayoutId_fk` (`fieldLayoutId`);

--
-- Indexes for table `craft_migrations`
--
ALTER TABLE `craft_migrations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_migrations_version_unq_idx` (`version`),
  ADD KEY `craft_migrations_pluginId_fk` (`pluginId`);

--
-- Indexes for table `craft_plugins`
--
ALTER TABLE `craft_plugins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `craft_rackspaceaccess`
--
ALTER TABLE `craft_rackspaceaccess`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_rackspaceaccess_connectionKey_unq_idx` (`connectionKey`);

--
-- Indexes for table `craft_relations`
--
ALTER TABLE `craft_relations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_relations_fieldId_sourceId_sourceLocale_targetId_unq_idx` (`fieldId`,`sourceId`,`sourceLocale`,`targetId`),
  ADD KEY `craft_relations_sourceId_fk` (`sourceId`),
  ADD KEY `craft_relations_sourceLocale_fk` (`sourceLocale`),
  ADD KEY `craft_relations_targetId_fk` (`targetId`);

--
-- Indexes for table `craft_routes`
--
ALTER TABLE `craft_routes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_routes_urlPattern_unq_idx` (`urlPattern`),
  ADD KEY `craft_routes_locale_idx` (`locale`);

--
-- Indexes for table `craft_searchindex`
--
ALTER TABLE `craft_searchindex`
  ADD PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`locale`);
ALTER TABLE `craft_searchindex` ADD FULLTEXT KEY `craft_searchindex_keywords_idx` (`keywords`);

--
-- Indexes for table `craft_sections`
--
ALTER TABLE `craft_sections`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_sections_name_unq_idx` (`name`),
  ADD UNIQUE KEY `craft_sections_handle_unq_idx` (`handle`),
  ADD KEY `craft_sections_structureId_fk` (`structureId`);

--
-- Indexes for table `craft_sections_i18n`
--
ALTER TABLE `craft_sections_i18n`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_sections_i18n_sectionId_locale_unq_idx` (`sectionId`,`locale`),
  ADD KEY `craft_sections_i18n_locale_fk` (`locale`);

--
-- Indexes for table `craft_sessions`
--
ALTER TABLE `craft_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_sessions_uid_idx` (`uid`),
  ADD KEY `craft_sessions_token_idx` (`token`),
  ADD KEY `craft_sessions_dateUpdated_idx` (`dateUpdated`),
  ADD KEY `craft_sessions_userId_fk` (`userId`);

--
-- Indexes for table `craft_shunnedmessages`
--
ALTER TABLE `craft_shunnedmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_shunnedmessages_userId_message_unq_idx` (`userId`,`message`);

--
-- Indexes for table `craft_structureelements`
--
ALTER TABLE `craft_structureelements`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_structureelements_structureId_elementId_unq_idx` (`structureId`,`elementId`),
  ADD KEY `craft_structureelements_root_idx` (`root`),
  ADD KEY `craft_structureelements_lft_idx` (`lft`),
  ADD KEY `craft_structureelements_rgt_idx` (`rgt`),
  ADD KEY `craft_structureelements_level_idx` (`level`),
  ADD KEY `craft_structureelements_elementId_fk` (`elementId`);

--
-- Indexes for table `craft_structures`
--
ALTER TABLE `craft_structures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `craft_systemsettings`
--
ALTER TABLE `craft_systemsettings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_systemsettings_category_unq_idx` (`category`);

--
-- Indexes for table `craft_taggroups`
--
ALTER TABLE `craft_taggroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_taggroups_name_unq_idx` (`name`),
  ADD UNIQUE KEY `craft_taggroups_handle_unq_idx` (`handle`),
  ADD KEY `craft_taggroups_fieldLayoutId_fk` (`fieldLayoutId`);

--
-- Indexes for table `craft_tags`
--
ALTER TABLE `craft_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_tags_groupId_fk` (`groupId`);

--
-- Indexes for table `craft_tasks`
--
ALTER TABLE `craft_tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_tasks_root_idx` (`root`),
  ADD KEY `craft_tasks_lft_idx` (`lft`),
  ADD KEY `craft_tasks_rgt_idx` (`rgt`),
  ADD KEY `craft_tasks_level_idx` (`level`);

--
-- Indexes for table `craft_templatecachecriteria`
--
ALTER TABLE `craft_templatecachecriteria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_templatecachecriteria_cacheId_fk` (`cacheId`),
  ADD KEY `craft_templatecachecriteria_type_idx` (`type`);

--
-- Indexes for table `craft_templatecacheelements`
--
ALTER TABLE `craft_templatecacheelements`
  ADD KEY `craft_templatecacheelements_cacheId_fk` (`cacheId`),
  ADD KEY `craft_templatecacheelements_elementId_fk` (`elementId`);

--
-- Indexes for table `craft_templatecaches`
--
ALTER TABLE `craft_templatecaches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_templatecaches_expiryDate_cacheKey_locale_path_idx` (`expiryDate`,`cacheKey`,`locale`,`path`),
  ADD KEY `craft_templatecaches_locale_fk` (`locale`);

--
-- Indexes for table `craft_tokens`
--
ALTER TABLE `craft_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_tokens_token_unq_idx` (`token`),
  ADD KEY `craft_tokens_expiryDate_idx` (`expiryDate`);

--
-- Indexes for table `craft_usergroups`
--
ALTER TABLE `craft_usergroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_usergroups_name_unq_idx` (`name`),
  ADD UNIQUE KEY `craft_usergroups_handle_unq_idx` (`handle`);

--
-- Indexes for table `craft_usergroups_users`
--
ALTER TABLE `craft_usergroups_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_usergroups_users_groupId_userId_unq_idx` (`groupId`,`userId`),
  ADD KEY `craft_usergroups_users_userId_fk` (`userId`);

--
-- Indexes for table `craft_userpermissions`
--
ALTER TABLE `craft_userpermissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_userpermissions_name_unq_idx` (`name`);

--
-- Indexes for table `craft_userpermissions_usergroups`
--
ALTER TABLE `craft_userpermissions_usergroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_userpermissions_usergroups_permissionId_groupId_unq_idx` (`permissionId`,`groupId`),
  ADD KEY `craft_userpermissions_usergroups_groupId_fk` (`groupId`);

--
-- Indexes for table `craft_userpermissions_users`
--
ALTER TABLE `craft_userpermissions_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_userpermissions_users_permissionId_userId_unq_idx` (`permissionId`,`userId`),
  ADD KEY `craft_userpermissions_users_userId_fk` (`userId`);

--
-- Indexes for table `craft_users`
--
ALTER TABLE `craft_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `craft_users_username_unq_idx` (`username`),
  ADD UNIQUE KEY `craft_users_email_unq_idx` (`email`),
  ADD KEY `craft_users_verificationCode_idx` (`verificationCode`),
  ADD KEY `craft_users_uid_idx` (`uid`),
  ADD KEY `craft_users_preferredLocale_fk` (`preferredLocale`);

--
-- Indexes for table `craft_widgets`
--
ALTER TABLE `craft_widgets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `craft_widgets_userId_fk` (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `craft_assetfolders`
--
ALTER TABLE `craft_assetfolders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_assetindexdata`
--
ALTER TABLE `craft_assetindexdata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_assetsources`
--
ALTER TABLE `craft_assetsources`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_assettransformindex`
--
ALTER TABLE `craft_assettransformindex`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_assettransforms`
--
ALTER TABLE `craft_assettransforms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_categorygroups`
--
ALTER TABLE `craft_categorygroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_categorygroups_i18n`
--
ALTER TABLE `craft_categorygroups_i18n`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_content`
--
ALTER TABLE `craft_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `craft_deprecationerrors`
--
ALTER TABLE `craft_deprecationerrors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_elementindexsettings`
--
ALTER TABLE `craft_elementindexsettings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_elements`
--
ALTER TABLE `craft_elements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `craft_elements_i18n`
--
ALTER TABLE `craft_elements_i18n`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `craft_emailmessages`
--
ALTER TABLE `craft_emailmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_entrydrafts`
--
ALTER TABLE `craft_entrydrafts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_entrytypes`
--
ALTER TABLE `craft_entrytypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `craft_entryversions`
--
ALTER TABLE `craft_entryversions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `craft_fieldgroups`
--
ALTER TABLE `craft_fieldgroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `craft_fieldlayoutfields`
--
ALTER TABLE `craft_fieldlayoutfields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `craft_fieldlayouts`
--
ALTER TABLE `craft_fieldlayouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `craft_fieldlayouttabs`
--
ALTER TABLE `craft_fieldlayouttabs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `craft_fields`
--
ALTER TABLE `craft_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `craft_info`
--
ALTER TABLE `craft_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `craft_matrixblocktypes`
--
ALTER TABLE `craft_matrixblocktypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_migrations`
--
ALTER TABLE `craft_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT for table `craft_plugins`
--
ALTER TABLE `craft_plugins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_rackspaceaccess`
--
ALTER TABLE `craft_rackspaceaccess`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_relations`
--
ALTER TABLE `craft_relations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_routes`
--
ALTER TABLE `craft_routes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_sections`
--
ALTER TABLE `craft_sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `craft_sections_i18n`
--
ALTER TABLE `craft_sections_i18n`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `craft_sessions`
--
ALTER TABLE `craft_sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `craft_shunnedmessages`
--
ALTER TABLE `craft_shunnedmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_structureelements`
--
ALTER TABLE `craft_structureelements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `craft_structures`
--
ALTER TABLE `craft_structures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `craft_systemsettings`
--
ALTER TABLE `craft_systemsettings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `craft_taggroups`
--
ALTER TABLE `craft_taggroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `craft_tasks`
--
ALTER TABLE `craft_tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_templatecachecriteria`
--
ALTER TABLE `craft_templatecachecriteria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_templatecaches`
--
ALTER TABLE `craft_templatecaches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_tokens`
--
ALTER TABLE `craft_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_usergroups`
--
ALTER TABLE `craft_usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_usergroups_users`
--
ALTER TABLE `craft_usergroups_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_userpermissions`
--
ALTER TABLE `craft_userpermissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_userpermissions_usergroups`
--
ALTER TABLE `craft_userpermissions_usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_userpermissions_users`
--
ALTER TABLE `craft_userpermissions_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `craft_widgets`
--
ALTER TABLE `craft_widgets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `craft_assetfiles`
--
ALTER TABLE `craft_assetfiles`
  ADD CONSTRAINT `craft_assetfiles_folderId_fk` FOREIGN KEY (`folderId`) REFERENCES `craft_assetfolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_assetfiles_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_assetfiles_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_assetsources` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_assetfolders`
--
ALTER TABLE `craft_assetfolders`
  ADD CONSTRAINT `craft_assetfolders_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `craft_assetfolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_assetfolders_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_assetsources` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_assetindexdata`
--
ALTER TABLE `craft_assetindexdata`
  ADD CONSTRAINT `craft_assetindexdata_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_assetsources` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_assetsources`
--
ALTER TABLE `craft_assetsources`
  ADD CONSTRAINT `craft_assetsources_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `craft_categories`
--
ALTER TABLE `craft_categories`
  ADD CONSTRAINT `craft_categories_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_categorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_categories_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_categorygroups`
--
ALTER TABLE `craft_categorygroups`
  ADD CONSTRAINT `craft_categorygroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `craft_categorygroups_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_categorygroups_i18n`
--
ALTER TABLE `craft_categorygroups_i18n`
  ADD CONSTRAINT `craft_categorygroups_i18n_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_categorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_categorygroups_i18n_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_content`
--
ALTER TABLE `craft_content`
  ADD CONSTRAINT `craft_content_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_content_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_elements_i18n`
--
ALTER TABLE `craft_elements_i18n`
  ADD CONSTRAINT `craft_elements_i18n_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_elements_i18n_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_emailmessages`
--
ALTER TABLE `craft_emailmessages`
  ADD CONSTRAINT `craft_emailmessages_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_entries`
--
ALTER TABLE `craft_entries`
  ADD CONSTRAINT `craft_entries_authorId_fk` FOREIGN KEY (`authorId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_entries_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_entries_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_entries_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `craft_entrytypes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_entrydrafts`
--
ALTER TABLE `craft_entrydrafts`
  ADD CONSTRAINT `craft_entrydrafts_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_entrydrafts_entryId_fk` FOREIGN KEY (`entryId`) REFERENCES `craft_entries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_entrydrafts_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `craft_entrydrafts_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_entrytypes`
--
ALTER TABLE `craft_entrytypes`
  ADD CONSTRAINT `craft_entrytypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `craft_entrytypes_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_entryversions`
--
ALTER TABLE `craft_entryversions`
  ADD CONSTRAINT `craft_entryversions_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `craft_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `craft_entryversions_entryId_fk` FOREIGN KEY (`entryId`) REFERENCES `craft_entries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_entryversions_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `craft_entryversions_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_fieldlayoutfields`
--
ALTER TABLE `craft_fieldlayoutfields`
  ADD CONSTRAINT `craft_fieldlayoutfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_fieldlayoutfields_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_fieldlayoutfields_tabId_fk` FOREIGN KEY (`tabId`) REFERENCES `craft_fieldlayouttabs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_fieldlayouttabs`
--
ALTER TABLE `craft_fieldlayouttabs`
  ADD CONSTRAINT `craft_fieldlayouttabs_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_fields`
--
ALTER TABLE `craft_fields`
  ADD CONSTRAINT `craft_fields_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_fieldgroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_globalsets`
--
ALTER TABLE `craft_globalsets`
  ADD CONSTRAINT `craft_globalsets_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `craft_globalsets_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_matrixblocks`
--
ALTER TABLE `craft_matrixblocks`
  ADD CONSTRAINT `craft_matrixblocks_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_matrixblocks_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_matrixblocks_ownerId_fk` FOREIGN KEY (`ownerId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_matrixblocks_ownerLocale_fk` FOREIGN KEY (`ownerLocale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `craft_matrixblocks_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `craft_matrixblocktypes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_matrixblocktypes`
--
ALTER TABLE `craft_matrixblocktypes`
  ADD CONSTRAINT `craft_matrixblocktypes_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_matrixblocktypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `craft_migrations`
--
ALTER TABLE `craft_migrations`
  ADD CONSTRAINT `craft_migrations_pluginId_fk` FOREIGN KEY (`pluginId`) REFERENCES `craft_plugins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_relations`
--
ALTER TABLE `craft_relations`
  ADD CONSTRAINT `craft_relations_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `craft_fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_relations_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_relations_sourceLocale_fk` FOREIGN KEY (`sourceLocale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `craft_relations_targetId_fk` FOREIGN KEY (`targetId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_routes`
--
ALTER TABLE `craft_routes`
  ADD CONSTRAINT `craft_routes_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_sections`
--
ALTER TABLE `craft_sections`
  ADD CONSTRAINT `craft_sections_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `craft_sections_i18n`
--
ALTER TABLE `craft_sections_i18n`
  ADD CONSTRAINT `craft_sections_i18n_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `craft_sections_i18n_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `craft_sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_sessions`
--
ALTER TABLE `craft_sessions`
  ADD CONSTRAINT `craft_sessions_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_shunnedmessages`
--
ALTER TABLE `craft_shunnedmessages`
  ADD CONSTRAINT `craft_shunnedmessages_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_structureelements`
--
ALTER TABLE `craft_structureelements`
  ADD CONSTRAINT `craft_structureelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_structureelements_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `craft_structures` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_taggroups`
--
ALTER TABLE `craft_taggroups`
  ADD CONSTRAINT `craft_taggroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `craft_fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `craft_tags`
--
ALTER TABLE `craft_tags`
  ADD CONSTRAINT `craft_tags_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_taggroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_tags_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_templatecachecriteria`
--
ALTER TABLE `craft_templatecachecriteria`
  ADD CONSTRAINT `craft_templatecachecriteria_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `craft_templatecaches` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_templatecacheelements`
--
ALTER TABLE `craft_templatecacheelements`
  ADD CONSTRAINT `craft_templatecacheelements_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `craft_templatecaches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_templatecacheelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_templatecaches`
--
ALTER TABLE `craft_templatecaches`
  ADD CONSTRAINT `craft_templatecaches_locale_fk` FOREIGN KEY (`locale`) REFERENCES `craft_locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craft_usergroups_users`
--
ALTER TABLE `craft_usergroups_users`
  ADD CONSTRAINT `craft_usergroups_users_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_usergroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_usergroups_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_userpermissions_usergroups`
--
ALTER TABLE `craft_userpermissions_usergroups`
  ADD CONSTRAINT `craft_userpermissions_usergroups_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `craft_usergroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_userpermissions_usergroups_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `craft_userpermissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_userpermissions_users`
--
ALTER TABLE `craft_userpermissions_users`
  ADD CONSTRAINT `craft_userpermissions_users_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `craft_userpermissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_userpermissions_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `craft_users`
--
ALTER TABLE `craft_users`
  ADD CONSTRAINT `craft_users_id_fk` FOREIGN KEY (`id`) REFERENCES `craft_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `craft_users_preferredLocale_fk` FOREIGN KEY (`preferredLocale`) REFERENCES `craft_locales` (`locale`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `craft_widgets`
--
ALTER TABLE `craft_widgets`
  ADD CONSTRAINT `craft_widgets_userId_fk` FOREIGN KEY (`userId`) REFERENCES `craft_users` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
