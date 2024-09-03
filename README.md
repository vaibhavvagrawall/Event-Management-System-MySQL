# Event Management System

## Overview

The Event Management System is a comprehensive application designed to streamline the organization and execution of various events. Utilizing MySQL for its backend, this system provides an organized approach to managing event details, tracking guest responses, and handling vendor contracts. Ideal for event planners and coordinators, this system ensures efficient data management and facilitates successful event planning.

## Features

- **Event Management**: Create and manage events, including details such as event name, date, time, venue, budget, and type.
- **Guest Management**: Add and manage guests with contact information and track their RSVP statuses.
- **Seating Arrangements**: Manage seating assignments for guests, including table and seat preferences.
- **Vendor Management**: Record details of vendors, manage contracts, and track services such as catering and decorations.
- **Expense Tracking**: Track and manage expenses related to each event to ensure budget compliance.

## Relationships

The system includes several key relationships between its database tables:

- **Events and RSVPs**: The `RSVPs` table references the `Events` table, linking guest responses to specific events.
- **Events and Seating Arrangements**: The `Seating_Arrangements` table links to the `Events` table, associating seating assignments with particular events.
- **Events and Vendor Contracts**: The `Vendor_Contracts` table connects to the `Events` table, documenting vendor contracts for specific events.
- **Vendors and Vendor Contracts**: The `Vendor_Contracts` table also references the `Vendors` table, linking contract details to specific vendors.
