#ifndef QSORTFILTERPROXYMODELQMLEXTENSION_H
#define QSORTFILTERPROXYMODELQMLEXTENSION_H

#include <QObject>
#include <QSortFilterProxyModel>

class QSortFilterProxyModelQmlExtension : public QObject
{
	Q_OBJECT

	Q_PROPERTY(QString filterRoleName READ filterRoleName WRITE setFilterRoleName)
	Q_PROPERTY(QString sortRoleName READ sortRoleName WRITE setSortRoleName)
	Q_PROPERTY(Qt::SortOrder sortOrder READ sortOrder WRITE setSortOrder)

public:
	explicit QSortFilterProxyModelQmlExtension(QObject *parent = nullptr);

	QString filterRoleName() const;
	QString sortRoleName() const;
	Qt::SortOrder sortOrder() const;

public slots:
	void setFilterRoleName(QString filterRoleName);
	void setSortRoleName(QString sortRoleName);
	void setSortOrder(Qt::SortOrder sortOrder);

private:
	QSortFilterProxyModel *_model;
	Qt::SortOrder m_sortOrder;
};

#endif // QSORTFILTERPROXYMODELQMLEXTENSION_H
