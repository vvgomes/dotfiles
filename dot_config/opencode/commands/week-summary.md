---
description: Generate a summary of journal entries for a given week
---

# Week Summary

## Goal

- Your goal is to generate a summary of my journal entries for a given week.

## Instructions

- The user will specify the week end date in the format `YYYY-MM-DD`.
- The date can fall in any of the week days. It is arbitrary.
- Start with content from 7 days prior to the end date.
- Include content from all dates in-between, when available.
- The summary must include a list of most common topics.
- Don't include adjectives which are not present in the content.
- It is OK to include words to summarize facts, ideas, and feelings.
- But not new words for adjectives.
- Please, add some analysis whenever themes show repeated.
- Try to identify the emotional profile and mood for the week.
- Point out any thing to be concerned about.

## The Data

- All the data is at `~/notes/journal`
- Each file in the directory has content from a specific month.
- File names follow this format: `YYYY-MM.md`
- The content is structured as markdown.
- The content is divided by sections representing specific dates.
- The format of each date section is `## YYYY-MM-DD`.
- When a week starts in one month and ends in the other, read both month files.

## The Output

- Translate all content to Brazilian Portuguese!
- Use Markdown for the output.
- Save the summary in a file at the following directory:
  - `~/notes/journal/`
- Name the file following this pattern:
  - `week-summary-end-date.md` where `end-date` is replaced by the user provided end date.

## User Input

- Week end date: $ARGUMENTS
