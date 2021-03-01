#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include <qqml.h>
#include <QtSql/QSqlDatabase>
#include <QtSql/QSqlDriver>
#include <QtSql/QSqlField>
#include <QtSql/QtSql>
#include <QtSql/QSqlError>

class Backend : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString isbn READ isbn WRITE setIsbn NOTIFY isbnChanged)
    Q_PROPERTY(QString nome READ nome WRITE setNome NOTIFY nomeChanged)
    Q_PROPERTY(QString autor READ autor WRITE setAutor NOTIFY autorChanged)
    Q_PROPERTY(QString categoria READ categoria WRITE setCategoria NOTIFY categoriaChanged)
    Q_PROPERTY(QString add_result READ addResult WRITE setAddResult NOTIFY addResultChanged)
    Q_PROPERTY(QStringList model READ model WRITE setModel NOTIFY modelChanged)

public:
    explicit Backend(QObject *parent = nullptr);

    ~Backend();

    void setIsbn(const QString &isbn);
    QString isbn() const;
    void setNome(const QString &nome);
    QString nome() const;
    void setAutor(const QString &autor);
    QString autor() const;
    void setCategoria(const QString &categoria);
    QString categoria() const;

    void setAddResult(const QString &add_result);
    QString addResult() const;

    void setModel(const QStringList &query);
    QStringList model();

    Q_INVOKABLE void saveBook();
    Q_INVOKABLE void removeBook();
    Q_INVOKABLE void getBooks();

signals:
    void isbnChanged();
    void nomeChanged();
    void autorChanged();
    void categoriaChanged();

    void addResultChanged();

    void modelChanged();

private:
    QString isbn_;
    QString nome_;
    QString autor_;
    QString categoria_;

    QString add_result_;

    QStringList model_;

    QSqlDatabase db_;
};

#endif // BACKEND_H
