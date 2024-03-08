## 4) Workflow: Code Style

Using a consistent coding style makes it easier for others and yourself to read your work, and is particularly important if you need to get help from someone else.

---

### Convention

#### Names

Remember that variable names should use only lowercase letters, numbers, and _. Use _ to separate words within a name. As a general rule of thumb, it is better to prefer long, descriptive names that are easy to understand rather than concise names that are fast to type. If you have a number of names for related things, do your best to be consistent. In general, if you have a bunch of variables that are a variation on a theme, you are better off giving them a common prefix rather than a common suffix because autocomplete works best on the start of a variable.

#### Spaces

Put spaces around the assignment operator and on either side of mathematical operators apart from ^. Do not put spaces inside or outside parenthesis for regular function calls. Always put a space after a comma. It is okay to add extra spaces if it improves alignment. For example, if you are creating multiple variables in $\texttt{mutate()}$, you might want to add spaces so that all the = line up.

#### Pipes

Pipes should always have a space before it and should typically be the last thing on a line. This makes it easier to add new steps, rearrange exiting steps, modify elements within a step, and clearly view a long list by skimming the verbs on the left side. If the function you are piping into has named arguments (like $\texttt{mutate()}$ or $\texttt{summarize()}$), put each argument on a new line. If the function does not have named arguments (like $\texttt{select()}$ or $\texttt{filter()}$), keep everything on one line unless it does not fit, in which case you should put each argument on its own line.

After the first step of the pipeline, indent each line by two spaces. If you are putting each argument on its own line, indent by an extra two spaces. It is okay to shirk some of these rules if your pipeline fits easily on one line. Finally, be wary of writing long pipes of longer than 10 - 15 lines. Try to break them up into smaller subtasks, giving each task an informative name. The names will help cue the reader into what is happening and makes it easier to check that intermediate results are as expected. The same basic rules that apply to the pipe also apply to ggplot2, treating + the same way as |>.

---

### Summary

We have learned the most important principles of code style. Over time it becomes clear how important a consistent style is. A helpful package is styler: it is a great way to quickly improve the quality of poorly styled code.