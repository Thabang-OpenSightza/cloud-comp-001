cloud-comp-001
GCP cloud architecture, Infrastructure as Code (Terraform), and multi-tenant deployment automation for OpenSightZA's Zero-Risk Rent-to-Buy digital transformation platform. Hosted in africa-south1 (Johannesburg).

OpenSightZA Cloud Computing Architecture & Infrastructure

Welcome to the official Cloud Computing portfolio and infrastructure repository for OpenSightZA. 

This repository serves two primary purposes:
1. Academic Portfolio: Demonstrating practical applications of Cloud Computing concepts (IaaS, PaaS, Multi-Tenancy, Infrastructure as Code) for university elective requirements.
2. Business Infrastructure: Housing the foundational cloud architecture, deployment automation, and technical documentation for OpenSightZA's "Zero-Risk Rent-to-Buy" digital transformation platform.

# OpenSightZA Ecosystem

An enterprise digital platform for **OpenSightZA** comprising a public storefront, AI assistant ("Neo"), private client gateway, administrative dashboard, and automated SOW (Scope of Work) generator with PDF export.

---

## 🌟 Key Features

### 1. Public Storefront & Portfolio Gateway (`PublicHub.tsx`)
- **Interactive Showcase**: Highlights OpenSightZA's digital transformation services, AI solutions, custom software engineering, and software IP buy-out models.
- **Client Portal Entry**: Secure gateway allowing clients and admins to authenticate via Firebase Authentication.

### 2. AI Digital Assistant - Neo (`ChatWidget.tsx` & `/api/chat`)
- **Powered by Gemini**: Server-side integration using `@google/genai` TypeScript SDK.
- **Intelligent Qualification**: Neo identifies qualified leads, answers technical questions, captures consultation details, and records session context in Firestore.
- **Email Notifications**: Automatically routes consultation requests and lead alerts directly to founder Thabang Ndweni's business inbox (`thabang.ndweni@opensightza.co.za`).
- **Official Contact**: Directs inquiries to Thabang Ndweni at `+27 73 999 2525`.

### 3. Client Portal (`ClientDashboard.tsx`)
- **Application Directory**: Displays active bespoke applications assigned to the logged-in client.
- **IP Buy-Out & Billing Tracking**: Tracks monthly retainers, payment progress, buy-out timeline, and retainer status (`Paid` / `Overdue`).
- **Support & Ticket Logging**: Enables clients to submit support tickets directly to the engineering team.

### 4. Admin Portal (`AdminDashboard.tsx`)
- **Super Admin Management**: Dedicated dashboard for `thabangndweni.poter@gmail.com` / `thabang.ndweni@opensightza.co.za`.
- **Client Profile Management**: Create, edit, and adjust client retainer terms, IP buy-out timelines, and account status.
- **Application Deployment Manager**: Register new client applications, toggle public visibility, or update deployment URLs.
- **Real-Time Synchronisation**: Live Firestore synchronization (`onSnapshot`) across client profiles, applications, and leads.

### 5. Smart SOW Builder (`SOWBuilder.tsx` & `SOWPdfTemplate.tsx`)
- **Modular SOW Scoping**: Interactive builder to define client business challenges, objectives, tech stack, feature breakdown (Must-Have, Should-Have, Nice-to-Have), and timelines.
- **Real-Time PDF Generation**: Compiles professional Annexure A Scope of Work documents using `@react-pdf/renderer` for instant preview and download.
- **Firestore Draft Storage**: Saves and loads draft SOW contracts directly in the `sows` collection.

---

## 🏗️ Technology Stack

- **Frontend**: React 19, TypeScript, Tailwind CSS v4, Motion (Framer Motion replacement), Lucide React Icons.
- **Backend**: Express 4 server on Node.js (`server.ts`), integrated Vite development middleware.
- **AI Integration**: `@google/genai` SDK (`gemini-2.5-flash` model alias with server-side proxy).
- **Database & Auth**: Firebase Firestore (real-time collections) & Firebase Authentication.
- **Document Processing**: `@react-pdf/renderer` for dynamic PDF generation.
- **Build & Bundle**: Vite + esbuild (`dist/server.cjs` CJS bundle for production execution).

---

## 🛠️ Environment Variables

Copy `.env.example` to `.env` or configure the following variables in your hosting environment:

```env
# Server-side Gemini API Key (Required for AI Chatbot)
GEMINI_API_KEY=your_gemini_api_key_here

# Firebase Web App Configuration (Required for Firestore & Auth)
VITE_FIREBASE_API_KEY=your_firebase_api_key
VITE_FIREBASE_AUTH_DOMAIN=your_project.firebaseapp.com
VITE_FIREBASE_PROJECT_ID=your_project_id
VITE_FIREBASE_STORAGE_BUCKET=your_project.appspot.com
VITE_FIREBASE_MESSAGING_SENDER_ID=your_messaging_sender_id
VITE_FIREBASE_APP_ID=your_app_id
```

---

## 🚦 Getting Started

### Installation

```bash
npm install
```

### Development Mode

Runs the Express server with `tsx` and Vite middleware on port `3000`:

```bash
npm run dev
```

Open `http://localhost:3000` in your browser.

### Production Build

Builds the React client to `dist/` and bundles `server.ts` into `dist/server.cjs` using `esbuild`:

```bash
npm run build
npm start
```

---

## 📬 Contact & Support

- **Founder & Lead**: Thabang Ndweni
- **Email**: `thabang.ndweni@opensightza.co.za`
- **Phone / WhatsApp**: `+27 73 999 2525`
- **Location**: Johannesburg, South Africa

