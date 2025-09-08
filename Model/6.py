import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import OneHotEncoder
from sklearn.compose import ColumnTransformer
from sklearn.ensemble import RandomForestClassifier
from sklearn.pipeline import Pipeline
from sklearn.metrics import accuracy_score
import joblib
import os

# --- 1. Load Dataset ---
df = pd.read_csv("New_career_dataset.csv")

# Features and target
X = df[['Interests', 'Skills', 'Education']]
y = df['Career']

# --- 2. OneHotEncoding for categorical features ---
preprocessor = ColumnTransformer(
    transformers=[
        ('cat', OneHotEncoder(handle_unknown='ignore'), ['Interests', 'Skills', 'Education'])
    ]
)

# --- 3. Build Pipeline ---
model = Pipeline(steps=[
    ('preprocessor', preprocessor),
    ('classifier', RandomForestClassifier(n_estimators=100, random_state=42))
])

# --- 4. Train/Test Split ---
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Train
model.fit(X_train, y_train)

# Evaluate
y_pred = model.predict(X_test)
accuracy = accuracy_score(y_test, y_pred)
print(f"Model Accuracy: {accuracy * 100:.2f}%")

# --- 5. Save Model ---
os.makedirs("trained_model", exist_ok=True)
joblib.dump(model, "trained_model/career_model.pkl")

# --- 6. Predict User Input ---
print("\n--- Career Prediction Based on Your Input ---")

# Reload trained pipeline
model = joblib.load("trained_model/career_model.pkl")

print("\nAvailable Interests:", df['Interests'].unique().tolist())
print("Available Skills:", df['Skills'].unique().tolist())
print("Available Education Levels:", df['Education'].unique().tolist())

# Get user input
user_interest = input("Enter your interest: ").strip()
user_skill = input("Enter your skill: ").strip()
user_education = input("Enter your education level: ").strip()

# --- 7. Predict ---
user_df = pd.DataFrame([[user_interest, user_skill, user_education]],
                       columns=['Interests', 'Skills', 'Education'])

if (user_interest not in df['Interests'].unique() or
    user_skill not in df['Skills'].unique() or
    user_education not in df['Education'].unique()):
    print("\n❌ Error: Your input must match the available categories exactly.")
else:
    probs = model.predict_proba(user_df)[0]
    top_indices = probs.argsort()[-3:][::-1]
    top_careers = model.classes_[top_indices]

    print("\n>>> Top Career Suggestions Based on Your Input:")
    for i, idx in enumerate(top_indices):
        print(f"{i + 1}. {top_careers[i]} ({probs[idx]*100:.2f}%)")
