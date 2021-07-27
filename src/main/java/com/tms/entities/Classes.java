package com.tms.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="classes")
public class Classes {
		
		@Id
		@GeneratedValue(strategy=GenerationType.AUTO)
		@Column(name="classes_id")
		private Long classesId;
		
		@Column(name="classes_Name")
		private String classesName;
		
		@Column(name="classes_Description")
		private String classesDescription;

		public Long getClassesId() {
			return classesId;
		}

		public void setClassesId(Long classesId) {
			this.classesId = classesId;
		}

		public String getClassesName() {
			return classesName;
		}

		public void setClassesName(String classesName) {
			this.classesName = classesName;
		}

		public String getClassesDescription() {
			return classesDescription;
		}

		public void setClassesDescription(String classesDescription) {
			this.classesDescription = classesDescription;
		}

		@Override
		public String toString() {
			return "Classes [classesId=" + classesId + ", classesName=" + classesName + ", classesDescription="
					+ classesDescription + "]";
		}
		
		


}
