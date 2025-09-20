# Prolog NLP Banking AI Knowledge Base

## Overview

This project implements a **banking knowledge base in Prolog** with the ability to answer **natural language queries**.  
The system models **people, banks, accounts, and cities** using facts and rules, and uses a simple **grammar-based parser** to interpret English-like questions.  

This project demonstrates how **logic programming** can be used for:  
- Knowledge representation  
- Natural language understanding  
- AI-driven query answering  


---

## Project Description

The knowledge base includes facts about:  
- **Accounts** — who owns which account, at what bank, with what balance.  
- **People** — gender, nationality, and city of residence.  
- **Banks** — which banks are Canadian or foreign, and their locations.  

On top of these, a **query system (`what/2`)** is implemented:  
- Parses natural language questions like *“a woman from markham with a medium account”*.  
- Uses Prolog rules to extract the answer(s).  
- Handles multiple answers through backtracking.  

---


