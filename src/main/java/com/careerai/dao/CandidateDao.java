package com.careerai.dao;

import com.careerai.model.Candidate;
import com.careerai.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class CandidateDao {

    public boolean saveCandidate(Candidate candidate) {
        String sql = "INSERT INTO candidate_profiles " +
                "(fullName, age, gender, education, subjects, hobbies, strengths, weaknesses, domains, experience) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, candidate.getFullName());
            stmt.setInt(2, candidate.getAge());
            stmt.setString(3, candidate.getGender());
            stmt.setString(4, candidate.getEducation());
            stmt.setString(5, candidate.getSubjects());
            stmt.setString(6, candidate.getHobbies());
            stmt.setString(7, candidate.getStrengths());
            stmt.setString(8, candidate.getWeaknesses());
            stmt.setString(9, candidate.getDomains());
            stmt.setString(10, candidate.getExperience());

            return stmt.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
